#ALB
resource "aws_lb" "elb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets
}

# Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instances_id)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances_id[count.index]
  port             = 80
}