# Define Local Values
locals {
  owners = var.team
  environment = var.environment
  name = "${local.owners}-${local.environment}"
  common_tags = {
      owners = local.owners
      environment = local.environment
  }
  asg_tags = [
    {
      key = "Project"
      value = "hendrix"
      propagate_at_launch = true
    },
    {
      key = "Launch_From"
      value = "TemplateOrConfiguration"
      propagate_at_launch = true
    }
  ]
}