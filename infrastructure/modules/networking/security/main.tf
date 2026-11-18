resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  
  dynamic ingress {
  	for_each = var.ingress
  	content {
  		from_port  		 		 = ingress.value.from_port
  		to_port    		 		 = ingress.value.to_port
  		protocol   		 		 = ingress.value.protocol
  		cidr_blocks 		 	 = lookup(ingress.value, "cidr_blocks", null)
  		source_security_group_id = lookup(ingress.value, "source_security_group_id", null) 
  	}
  }
  
  dynamic egress {
  	for_each = var.egress
  	content {
  		from_port  		 		 = egress.value.from_port
  		to_port    		 		 = egress.value.to_port
  		protocol   		 		 = engress.value.protocol
  		cidr_blocks 		 	 = lookup(engress.value, "cidr_blocks", null)
  		source_security_group_id = lookup(engress.value, "source_security_group_id", null) 
  	}
  }

  tags = {
    Name = var.sg_name
  }
}


