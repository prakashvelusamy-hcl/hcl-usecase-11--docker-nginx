run "test_ec2_instance_creation" {
  command = "plan"
  condition = length(module.ec2.public_instance_ids) > 0
}

run "test_ec2_instance_tags" {
  condition = alltrue([for instance_name in module.ec2.public_instance_names : instance_name == "Public-Instance-usecase-11-NGINX & Docker"])
}
