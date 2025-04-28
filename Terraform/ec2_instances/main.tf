resource "aws_instance" "public_ec2" {
  ami                   = "ami-0e449927258d45bc4"
  instance_type         = var.instance_type
  subnet_id             = var.public_subnet_id
  key_name              = "example"  # Use the existing key pair
  vpc_security_group_ids = [var.sg_id]  # Use sg_id from module (correct argument)

  associate_public_ip_address = true

  iam_instance_profile        = var.instance_profile_name #I am role s3

  tags = {
    Name = "Public-EC2-${terraform.workspace}"
  }
}

resource "aws_instance" "private_ec2" {
  ami                   = "ami-0e449927258d45bc4"
  instance_type         = var.instance_type
  subnet_id             = var.private_subnet_id
  key_name              = "example"  # Use the existing key pair
  vpc_security_group_ids = [var.sg_id]  # Use sg_id from module (correct argument)

  associate_public_ip_address = false

  iam_instance_profile        = var.instance_profile_name #Iam Role s3

  tags = {
    Name = "Private-EC2-${terraform.workspace}"
  }
}
