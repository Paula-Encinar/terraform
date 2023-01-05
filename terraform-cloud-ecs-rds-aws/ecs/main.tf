resource "aws_ecs_cluster" "ecs_cluster"{
    name = "ecs_cluster"
}

resource "aws_ecs_service" "hello_world" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.hello_world_task.id]
    subnets         = aws_subnet.private.*.id
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.hello_world.id
    container_name   = "hello-world-app"
    container_port   = 3000
  }

  depends_on = [aws_lb_listener.hello_world]
}

# Load Balancers
module "loadbalancers" {
  source            = "./loadbalancers"
  vpc_id            = var.vpc_id
  public_subnets    = var.public_subnets
  sg_lb_backend     = module.security_groups.sg_lb_backend
  sg_lb_frontend    = module.security_groups.sg_lb_frontend
  long_environment  = var.long_environment
}

# Security Groups
module "security_groups" {
  source            = "./securitygroups"
  vpc_id            = var.vpc_id
  long_environment  = var.long_environment
}