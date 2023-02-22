module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9.0"
  # insert the 3 required variables here

  name = "private_sg"
  description = "Security Group with HTTP & SSH port open for VPC Blcok. "
  vpc_id = var.vpc_id
  # Ingress rule
  ingress_cidr_blocks = [var.vpc_cidr_block]
  ingress_rules = ["ssh-tcp","http-80-tcp"]
  # Egress rule
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]

  tags = local.common_tags
}