variable "requester_region" {
    description = "Requester Region (us-east-1)"
    type        = string
    default     = "us-east-1"
}

variable "accepter_region" {
    description = "Accepter Region (us-west-2)"
    type        = string
    default     = "us-west-2"
}

variable "requester_region_name" {
    description = "Requester Region Name"
    type        = string
    default     = "virginia"
}

variable "accepter_region_name" {
    description = "Accepter Region Name"
    type        = string
    default     = "oregon"
}

variable "requester_vpc_id" {
    description = "Requester VPC ID"
    type        = string
}

variable "accepter_vpc_id" {
    description = "Accepter VPC ID"
    type        = string
}

variable "requester_vpc_cidr" {
    description = "Requester VPC CIDR"
    type        = string
}

variable "accepter_vpc_cidr" {
    description = "Accepter VPC CIDR"
    type        = string    
}

variable "requester_rtb_ids" {
    description = "Requester RTB id (public, private)"
    type        = list(string)
}

variable "accepter_rtb_ids" {
    description = "Accepter RTB id (public, private)"
    type        = list(string)
}