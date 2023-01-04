resource "aws_appautoscaling_target" "ecs_frontend" {
  max_capacity       = 10
  min_capacity       = 4
  resource_id        = "service/${var.cluster_name}/${var.frontend_svc_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_target" "ecs_backend" {
  max_capacity       = 10
  min_capacity       = 4
  resource_id        = "service/${var.cluster_name}/${var.backend_svc_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

## auto scaling policies ##
resource "aws_appautoscaling_policy" "ecs_targetscale_backend_cpu" {
  name               = "ECSCPUAutoscale"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_backend.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_backend.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_backend.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value        = 75
    scale_in_cooldown   = 300
    scale_out_cooldown  = 300
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
}

resource "aws_appautoscaling_policy" "ecs_targetscale_frontend_cpu" {
  name               = "ECSCPUAutoscale"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_frontend.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_frontend.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_frontend.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value        = 75
    scale_in_cooldown   = 300
    scale_out_cooldown  = 300
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
}

resource "aws_appautoscaling_policy" "ecs_targetscale_backend_memory" {
  name               = "ECSMEMAutoscale"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_backend.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_backend.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_backend.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value        = 90
    scale_in_cooldown   = 300
    scale_out_cooldown  = 300
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
  }
}

resource "aws_appautoscaling_policy" "ecs_targetscale_frontend_memory" {
  name               = "ECSMEMAutoscale"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_frontend.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_frontend.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_frontend.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value        = 90
    scale_in_cooldown   = 300
    scale_out_cooldown  = 300
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
  }
}