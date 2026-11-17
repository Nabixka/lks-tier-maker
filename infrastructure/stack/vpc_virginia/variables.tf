variable "aws_region" {
    description = "AWS Region"
    type        = string
    default     = "us-east-1
}

variable "cidr_block" {
    description = "CIDR Block"
    type        = string
    default     = "10.0.0.0/16
}

variable "public_subnet_cidr" {
    description = "Publc Subnet CIDR"
    type        = list(string)
    default     = ["10.0.0.0/20", "10.0.0.1/20"]
}

variable "private_subnet_cidr" {
    description = "Private Subnet CIDR"
    type        = list(string)
    default     = ["10.0.0.10/20". "10.0.0.11/20"]
}