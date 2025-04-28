# Provider 

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "instance_type" {
  description = "EC2 instance type based on environment (t2.micro for dev, t3.micro for qa)"
  type        = string
}
