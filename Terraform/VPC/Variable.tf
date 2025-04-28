# VPC Variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public Subnets Variables
variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_names" {
  description = "List of names for the public subnets"
  type        = list(string)
  default     = ["public-subnet-1", "public-subnet-2", "public-subnet-3"]
}

# Private Subnets Variables
variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnet_names" {
  description = "List of names for the private subnets"
  type        = list(string)
  default     = ["private-subnet-1", "private-subnet-2", "private-subnet-3"]
}

# Region Variables
variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-1"
}
