
# Private EC2 Instance 
output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = module.private_sg.security_group_id
}
output "private_security_group_vpc_id" {
  description = "The private VPC ID"
  value       = module.private_sg.security_group_vpc_id
}

output "private_security_group_name" {
  description = "The name of the private security group"
  value       = module.private_sg.security_group_name
}

output "private_security_group_description" {
  description = "The description of the security group"
  value       = module.private_sg.security_group_description
}