variable "iam_role_name" {
  description = "IAM Role name for EC2 to access S3"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM Policy name for allowing S3 access"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket that EC2 can access"
  type        = string
}
