variable "aws_region_name" {
    description = "AWS Region Name"
    type        = string
}

variable "enable_dns_hostnames" {
    description = "DNS Hostname"
    type        = boolean
    default     = false
}

variable "enable_dns_support" {
    description = "DNS Support"
    type        = boolean
    default     = false
}

variable "cidr_block" {
    description = "VPC Cidr Block"
    type        = string
}

variable "public_subnet_cidr" {
    description = "Public Subnet CIDR"
    type        = list(string)
}

variable "private_subnet_cidr" {
    description = "Private Subnet CIDR"
    type        = list(string)
}

variable "availability_zone" {
    description = "availability zone"
    type        = list(string)
}