# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-southeast-2"
}

# Environment
variable "environment" {
  description = "Environment"
  type = string
}

# Team
variable "team" {
  description = "Team"
  type = string
}

# Credential Profile
variable "aws_credential_profile" {
  description = "Your Own AWS credential Profile"
  type = string
}

# Route 53 Domain - Host Zone
variable "mydomain" {
  description = "Route 53 Domain - Host Zone"
  type = string
}
# SNS Notification Email Endpoint
variable "sns_email_endpoint" {
  description = "SNS Email Endpoint"
  type = string
}

# ASG Desired Instance
variable "asg_desired" {
  description = "Desired Number of Instances"
  type = number
}

# ASG Max Instance
variable "asg_max" {
  description = "Max Number of Instances"
  type = number
}

# ASG Min Instance
variable "asg_min" {
  description = "Min Number of Instances"
  type = number
}