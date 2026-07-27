output "repository_name" {
  value = aws_ecr_repository.travelbuddy.name
}

output "repository_url" {
  value = aws_ecr_repository.travelbuddy.repository_url
}

output "repository_arn" {
  value = aws_ecr_repository.travelbuddy.arn
}