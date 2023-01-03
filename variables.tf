variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable environment{
  type        = string
  description = "environment"
}

variable vpc_cidr_block{
  type        = string
  description = "Ip range to be used"
}