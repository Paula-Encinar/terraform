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
}

module "vpc"{
    source= "./vpc"
    vpc_id = module.vpc.vpc.id
}

# RDS
module "rds" {
    source            = "./rds"
    db_password       = var.db_password
    vpc_id            = module.vpc.vpc_id
}

module "ecs"{
    source = "./ecs"
    public_subnets   = module.vpc.public_subnet_1
    vpc_id           = module.vpc.vpc_id
}

