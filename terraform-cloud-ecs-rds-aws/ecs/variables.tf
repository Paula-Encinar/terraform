variable "aws_region" {
  description = "the default region for resources in this environment"
  default     = "eu-west-2"
}

variable "public_subnets"{}
variable "vpc_id" {}