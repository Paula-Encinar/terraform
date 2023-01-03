# Main terraform file for ALL the environments!!!
terraform {
  cloud {
    organization = "onebeyond-paula"
    workspaces {
      name = "terraform-aws-ec2-instance"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"
    }
  }
}
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}