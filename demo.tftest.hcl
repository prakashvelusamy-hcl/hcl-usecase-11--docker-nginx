run "test_ec2_instance_creation" {
  command = plan
}

assert "test_ec2_instance_creation" {
  condition = length(module.ec2.public_instance_ids) > 0
  error_message = "No EC2 instances were created!"
}

assert "test_ec2_instance_tags" {
  condition = alltrue([for instance_name in module.ec2.public_instance_names : instance_name == "Public-Instance-usecase-11-NGINX & Docker"])
  error_message = "EC2 instance name does not match expected value!"
}

