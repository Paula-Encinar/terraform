# Main terraform file for ALL the environments!!!
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onebeyond-paula"

    workspaces {
      prefix = "terraform-"
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