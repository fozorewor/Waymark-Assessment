
resource "aws_autoscaling_group" "ecs_asg" {
  name                = var.name
  vpc_zone_identifier = var.subnets
  capacity_rebalance  = true
  target_group_arns   = var.target_group_arns

  launch_template {
    id      = var.launch_template
    version = "$Latest"
  }
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"

  tag {
    key                 = "AmazonEC2Managed"
    value               = ""
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }

  }
}
