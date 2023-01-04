resource "aws_alb" "alb_frontend" {
  name            = "frontend-${var.long_environment}"
  subnets         = var.public_subnets.*.id #public_subnets
  security_groups = [var.sg_lb_frontend]
}