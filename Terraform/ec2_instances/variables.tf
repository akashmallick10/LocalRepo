variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}

variable "sg_id" {
  description = "ID of the Security Group"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name to attach to EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type based on workspace (t2.micro for dev, t3.micro for qa)"
  type        = string
}

