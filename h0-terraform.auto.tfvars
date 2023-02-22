# Generic Variables  
aws_credential_profile = "your_own_credential" # configured in ~/.aws/credentials
aws_region = "ap-southeast-2"
environment = "stage"
team = "tech"

# EC2 Instance Variable
instance_type = "t3.micro"
instance_keypair = "private-lora-central"

# ASG Number of Instances
asg_desired = 2
asg_max = 3
asg_min = 1

# Default DNS Name for ALB
mydomain = "sparkiot.click"
default_dns_name = "application.sparkiot.click"

# SNS Topic Email Endpoint
sns_email_endpoint = "harry.zhou@spark.co.nz"

# VPC Varibales
ec2_bastin_public_ip = "3.106.103.69"
vpc_id = "vpc-0167f135400bd2d58"
vpc_cidr_block = "20.0.0.0/16"
public_subnets = [
  "subnet-08dbef7e3fbb26605",
  "subnet-0494f313010ca7b32",
]
private_subnets = [
  "subnet-0a9496ebee0c9ff2b",
  "subnet-0f8a55cbf801af519",
]
database_subnets = [
  "subnet-0b37703261336c7e2",
  "subnet-02da3ef776388877e",
]
database_subnet_group_name = "tech-stage-my-vpc"