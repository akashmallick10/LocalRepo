output "public_ec2_id" {
  description = "The ID of the public EC2 instance"
  value       = aws_instance.public_ec2.id
}

output "private_ec2_id" {
  description = "The ID of the private EC2 instance"
  value       = aws_instance.private_ec2.id
}
