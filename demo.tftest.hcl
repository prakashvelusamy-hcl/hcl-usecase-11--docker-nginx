test {
  command = plan

  assertions {
    resource_changes {
      type   = "aws_instance"
      action = "create"

      attribute_conditions {
        key      = "tags.Name"
        value    = "Public*"
        operator = "contains"
      }
    }
  }
}

# test "ec2_instance_exists" {
#   command = plan

#   assertions {
#     resource_changes {
#       type   = "aws_instance"
#       action = "create"

#       # Ensure the instance has a tag containing "Public"
#       attribute_conditions {
#         key   = "tags.Name"
#         value = "Public*"
#         operator = "contains"
#       }
#     }
#   }
# }


# test "ec2_instance_exists" {
#   command = plan
 
#   assertions {
#     resource_changes {
#       type   = "aws_instance"
#       action = "create"
#     }
#   }
# }