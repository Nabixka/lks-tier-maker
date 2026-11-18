variable "ami" {
    description = "AMI Ubuntu"
    type        = string
    default     = ""
}

variable "instance_type" {
    description = "Instance Type"
    type        = string
    default     = "t3.micro
}

variable "associate_public_ip_address" {
    description = "Associate Public IP"
    type        = boolean
    default     = false
}

variable "source_dest_check" {
    description = "Source Dest Check"
    type        = boolean
    default     = true
}

variable "subnet_id" {
    description = "Subnet Id"
    type        = string
}

variable "user_data_path" {
    description = "Path of user_data"
    type        = string
}

variable "e2_name" {
    description = "EC2 Name"
    type        = string
}

variable "vpc_sg_id" {
    description = "Security Id"
    type        = list(string)
}