variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "vpc_name" {
  description = "name of VPC"
  type        = string
}

variable "address_space" {
  description = "IPv4 range of VPC"
  type        = string
}

variable "azs_public" {
  description = "public availability zone"
  type        = string
}

variable "azs_private" {
  description = "private availability zone"
  type        = string
}

variable "public_subnet" {
  description = "public IPv4 subnet"
  type        = string
}

variable "private_subnet" {
  description = "private IPv4 subnet"
  type        = string
}

output "sg_output" {
  value = aws_security_group.allow_web_ssh
}

output "public_subnet_id" {
  value = aws_subnet.tf-public-sn.id
}

output "private_subnet_id" {
  value = aws_subnet.tf-public-sn.id
}
