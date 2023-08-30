  variable "ami_id" {
    type = string
    description = "AMI ID" 
     }
  
  variable "instance_type" {
    type = string
    description = "EC2 instance type"
  }

  variable "availability_zone" {
    type = string
    description = "Availability Zone"
  }

  variable "tags" {
    type = map(string)
    description = "Tags"
  }

  variable "security_group_name" {
    type = string
    description = "Security Group Name"
  }

  variable "security_description" {
    type = string
    description = "Security Group description"
  }

  variable "security_group_inbound_rules" {
    type = list(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
      description = string

    }))
    description = "Security Group Inbound rules"
  }

   variable "sg_tags" {
    type = map(string)
    description = "SG Tags"
  } 
