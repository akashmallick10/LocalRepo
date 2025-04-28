variable "subnet_ids" {
  description = "The subnet IDs where the load balancer will be deployed"
  type        = list(string)
}

variable "sg_id" {
  description = "The security group ID associated with the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the load balancer and target group are deployed"
  type        = string
}
