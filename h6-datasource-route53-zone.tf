data "aws_route53_zone" "mydomain" {
  name = var.mydomain
}

output "mydomain_zoneid" {
    description = "The hosted zone id of the desired Hosted Zone"
    value = data.aws_route53_zone.mydomain.zone_id
}