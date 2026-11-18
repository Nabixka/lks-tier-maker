variable "aws_region_1" {
    description = "AWS Region"
    type        = string
    default     = "us-east-1
}

variable "aws_region_2" {
    description = "AWS Region"
    type        = string
    default     = "us-west-2
}

variable "virginia_cidr_block" {
    description = "CIDR Block"
    type        = string
    default     = "10.10.0.0/20
}

variable "virginia_public_subnet_cidr" {
    description = "Publc Subnet CIDR"
    type        = list(string)
    default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "virginia_private_subnet_cidr" {
    description = "Private Subnet CIDR"
    type        = list(string)
    default     = ["10.10.11.0/24". "10.10.12.0/24"]
}

variable "oregon_cidr_block" {
    description = "CIDR Block"
    type        = string
    default     = "10.20.0.0/20
}

variable "oregon_public_subnet_cidr" {
    description = "Publc Subnet CIDR"
    type        = list(string)
    default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "oregon_private_subnet_cidr" {
    description = "Private Subnet CIDR"
    type        = list(string)
    default     = ["10.20.12.10/24". "10.20.12.0/24"]
}

