resource "aws_security_group" "my_sg" {
  name        = var.sg_name
  description = "Security Group for EC2 instances"
  vpc_id      = var.vpc_id
}
