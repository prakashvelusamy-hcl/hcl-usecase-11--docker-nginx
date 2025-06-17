variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "project_name" {
  description = "The Project name"
  type = string
}
variable "environment" {
description = "The environment name"
type = string
}
variable "pub_sub_count" {
  description = "Number of public subnets"
  type        = number
}

variable "priv_sub_count" {
  description = "Number of private subnets"
  type        = number
}

variable "nat_count" {
  description = "Number of NAT gateways"
  type        = number
}