output "vpc_id" {
    description = "VPC ID"
    value       = module.vpc.vpc_id 
}

output "vpc_cidr_block" {
    description = "VPC CIDR Block"
    value       = module.vpc.vpc_cidr_block
}

output "vpc_public_id" {
    description = "Public Subnet Id"
    value       = [for s in module.vpc.vpc_public_id : s]
}

output "vpc_private_id" {
    description = "Private Subnet Id"
    value       = [for s in module.vpc.vpc_private_id : s]
}

output "vpc_public_cidr" {
    description = "Public Subnet Cidr Block"
    value       = [for s in module.vpc.vpc_public_cidr_block : s]
}

output "vpc_private_cidr" {
    description = "Private Subnet Cidr Block"
    value       = [for s in module.vpc.vpc_private_cidr_block : s]
}

output "vpc_public_route_table" {
    description = "Publc Route Table"
    value       =  module.vpc.vpc_public_route_table
}

output "vpc_private_route_table" {
    description = "Private Route Table"
    value       =  module.vpc.vpc_private_route_table
}