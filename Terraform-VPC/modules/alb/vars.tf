variable "sg_id" {
  description = "sg id for application loadbalancer"
  type = string
}
variable "subnets" {
  description = "subnets for alb"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc id for alb"
  type = string
}

variable "instances_id" {
  description = "Instances id for target group attachment"
  type = list(string)
}