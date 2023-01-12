terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Owner = "Phil"
      ManagedBy = "Terraform"
      Environment = "Stage"
    }
  }
}