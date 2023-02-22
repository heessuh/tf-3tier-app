module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name,".")
  zone_id      = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [
    "*.${trimsuffix(data.aws_route53_zone.mydomain.name,".")}",
  ]

  wait_for_validation = true

  tags = local.common_tags
}


# Output
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value = module.acm.acm_certificate_arn
}