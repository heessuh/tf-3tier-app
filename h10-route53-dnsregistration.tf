# DNS Registration
# Default DNS
resource "aws_route53_record" "myapp_default_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.default_dns_name
  type    = "A"
#   ttl = 300
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}
