output "frontend_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "backend_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "packages_repo_url" {
  value = aws_ecr_repository.packages.repository_url
}
