variable "sg_name" {
	description = "Name of the security group"
	type        = string
}

variable "sg_description" {
	description = "Description of the security group"
	type	    = string
}

variable "vpc_id" {
	description = "VPC Id"
	type	    = string
}

variable "ingress" {
	description = "Ingress Rules"
	type        = list(object({
		from_port   	  = number
		to_port     	  = number
		protocol    	  = string
		cidr_blocks 	  = optional(list(string))
		security_group_id = optional(string)
	}))
	default     = []
}

variable "egress" {
	description = "Egress Rules"
	type        = list(object({
		from_port   	  = number
		to_port     	  = number
		protocol    	  = string
		cidr_blocks 	  = optional(list(string))
		security_group_id = optional(string)
	}))
	default     = []
}
