resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = var.tags
  }

resource "aws_security_group" "sg" {

  name        = var.security_group_name
  description = var.security_description
 
   dynamic "ingress"{

     for_each = var.security_group_inbound_rules
     content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
        description = ingress.value.description
     }
   }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = var.sg_tags
}

