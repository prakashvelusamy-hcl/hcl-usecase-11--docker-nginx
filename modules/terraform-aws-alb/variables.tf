variable "public_instance_ids" {
  description = "The public instance ID"
  type = list(string)
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs to launch EC2 instances into"
  type        = list(string)
}
variable "vpc_id" {
  description = "VPC ID to use for EC2 instances and security groups"
  type        = string
}