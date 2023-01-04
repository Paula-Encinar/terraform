resource "aws_alb" "alb_frontend" {
  name            = "frontend-${var.long_environment}"
  subnets         = var.public_subnets.*.id #public_subnets
  security_groups = [var.sg_lb_frontend]
}
resource "aws_alb_target_group" "frontend_app_blue" {
  name        = "front-tg-${var.long_environment}-blue"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/__/manifest"
    unhealthy_threshold = "2"
  }
}