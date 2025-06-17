run "test_ec2_instance_creation" {
  command = plan
  
  checks = [
    {
      name        = "EC2 instance creation check"
      condition   = length(module.ec2.public_instance_ids) > 0
      error_message = "No EC2 instances were created!"
    }
  ]
}

run "test_ec2_instance_tags" {
  command = plan
  
  checks = [
    {
      name        = "EC2 instance name validation"
      condition   = alltrue([for instance_name in module.ec2.public_instance_names : instance_name == "Public-Instance-usecase-11-NGINX & Docker"])
      error_message = "EC2 instance name does not match expected value!"
    }
  ]
}


