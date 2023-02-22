resource "aws_autoscaling_group" "my_asg" {
  name_prefix = "myasg-"
  desired_capacity   = var.asg_desired
  max_size           = var.asg_max
  min_size           = var.asg_min
#   availability_zones = var.vpc_availability_zone   # Conflicts with vpc_zone_identifier
  vpc_zone_identifier = var.private_subnets

  target_group_arns = module.alb.target_group_arns

  launch_template {
    id      = aws_launch_template.my_new_lt.id  # no need to add resoure in the
    # version = "$Latest"
    version = aws_launch_template.my_new_lt.latest_version
  }

  health_check_type = "EC2"
  health_check_grace_period = 120

  instance_refresh {
    strategy = "Rolling"
    preferences {
      # instance_warmup = 300
      min_healthy_percentage = 50
    }
    triggers = [ "desired_capacity" ]
  }
  
  tag {
    key = "Team"
    value = var.team
    propagate_at_launch = true
  }
}