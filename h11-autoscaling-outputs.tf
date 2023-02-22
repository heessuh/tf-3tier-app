# Launch Template
output "launch_template_id" {
    description = "Launch Template ID"
    value = aws_launch_template.my_new_lt.id
}

output "launch_template_latest_version" {
    description = "Launch Template Latest Version"
    value = aws_launch_template.my_new_lt.latest_version
}

# Auto Scaling Group
output "autoscaling_group_id" {
    description = "Auto Scaling Group Id"
    value = aws_autoscaling_group.my_asg.id
}

output "autoscaling_group_name" {
    description = "Auto Scaling Group Name"
    value = aws_autoscaling_group.my_asg.name
}

output "autoscaling_group_arn" {
    description = "Auto Scaling Group Arn"
    value = aws_autoscaling_group.my_asg.arn
}