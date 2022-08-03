terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "ecr" {
  name         = "container-images-repo"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}