resource "aws_instance" "public_ec2" {
  ami                   = "ami-0e449927258d45bc4"
  instance_type         = "t2.micro"
  subnet_id             = var.public_subnet_id
  key_name              = var.key_name  # Use the key_name passed into the module
  vpc_security_group_ids = [var.sg_id]  # Use sg_id from module (correct argument)

  associate_public_ip_address = true

  tags = {
    Name = "Public-EC2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                   = "ami-0e449927258d45bc4"
  instance_type         = "t3.micro"
  subnet_id             = var.private_subnet_id
  key_name              = var.key_name  # Use the key_name passed into the module
  vpc_security_group_ids = [var.sg_id]  # Use sg_id from module (correct argument)

  associate_public_ip_address = false

  tags = {
    Name = "Private-EC2"
  }
}
