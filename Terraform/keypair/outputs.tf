output "key_pair_name" {
  description = "The name of the EC2 Key Pair"
  value       = aws_key_pair.example.key_name
}