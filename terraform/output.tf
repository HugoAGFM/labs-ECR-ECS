output "ecr_name" {
  value = aws_ecr_repository.ecr.name
}

output "ecr_uri" {
  value = aws_ecr_repository.ecr.repository_url
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "region" {
  value = data.aws_region.current.name
}
