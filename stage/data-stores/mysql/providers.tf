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