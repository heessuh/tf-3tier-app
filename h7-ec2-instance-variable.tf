# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair"
  type = string
  default = "private-lora-sandpit"
}

variable "private_instance_count" {
  description = "AWS EC2 private instances count"
  type = number
  default = 1
}