variable "ec2_bastin_public_ip" {
  description = "Bastion Public IP"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
}

variable "public_subnets" {
  description = "Public Subnet List"
  type = list(string)
}

variable "private_subnets" {
  description = "Private Subnet List"
  type = list(string)
}

variable "database_subnets" {
  description = "Database Subnet List"
  type = list(string)
}

variable "database_subnet_group_name" {
  description = "Database Subnet Group Name"
  type = string
}

