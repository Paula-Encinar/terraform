variable "long_environment" {}

variable "aws_region" {
  description = "the default region for resources in this environment"
  default     = "eu-west-2"
}

variable "app_port_frontend" {
  description = "Port exposed from the frontend docker container"
  default     = 4000
}

variable "app_port_backend" {
  description = "Port exposed from the backend docker container"
  default     = 5000
}

variable "app_frontend_service_name_dev" {
  description = "Name of the frontend service in the dev ecs cluster"
  default     = "frontend-service-development"
}

variable "app_frontend_container_name" {
  description = "Name of the frontend container name"
  default     = "frontend-container"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "EcsTaskExecutionRole"
}

variable "app_backend_container_name"{
  description = "Name of the backend service in the dev ecs cluster"
  default     = "backend-container"
}

variable "db_password_arn" {}
variable "db_username_arn" {}
variable "db_endpoint" {}
variable "public_subnets"{}
variable "private_subnets"{}
variable "vpc_id" {}