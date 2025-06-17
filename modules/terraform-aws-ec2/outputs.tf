output "public_instance_ids" {
  description = "List of EC2 instance IDs for public instances"
  value       = aws_instance.public_instances[*].id
}

output "public_instance_ips" {
  description = "List of public IP addresses for the public instances"
  value       = aws_instance.public_instances[*].public_ip
}

# output "test_user_data_content" {
#   value = local.user_data_files[0]
# }
