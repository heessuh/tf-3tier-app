module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9.0"

  name = "loadbalancer_sg"
  description = "Security Group with HTTP and HTTPs open to entire internet range.... "
  vpc_id = var.vpc_id
  # Ingress rule
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = ["http-80-tcp","https-443-tcp"]
  # Egress rule
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]

  tags = local.common_tags
}