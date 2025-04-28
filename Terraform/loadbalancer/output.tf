output "load_balancer_dns" {
  description = "The DNS name of the Load Balancer"
  value       = aws_lb.akash.dns_name
}

output "load_balancer_arn" {
  description = "The ARN of the Load Balancer"
  value       = aws_lb.akash.arn
}
