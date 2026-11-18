# Virginia
output "virginia_vpc_id" {
    description = "Virginia VPC Id"
    value       = module.vpc_virginia.vpc_id
}

output "virginia_cidr_block" {
    description = "Virginia VPC Cidr Block"
    value       = module.vpc_virginia.vpc_cidr_block"
}

output "virginia_public_subnet_id" {
    description = "Virginia Public Subnet Id"
    value       = module.vpc_virginia.vpc_public_id
}

output "virginia_private_subnet_id" {
    description = "Virginia Private Subnet Id"
    value       = module.vpc_virginia.vpc_private_id
}

output "virginia_public_subnet_cidr" {
    description = "Virginia Public Subnet CIDR"
    value       = module.vpc_virginia.vpc_public_cidr_block
}

output "virginia_private_subnet_cidr" {
    description = "Virginia Private Subnet CIDR"
    value       = module.vpc_virginia.vpc_private_cidr_block
}

output "virginia_public_rtb" {
    description = "Virginia Public RTB"
    value       = module.vpc_virginia.vpc_public_route_table
}

output "virginia_private_rtb" {
    description = "Virginia Private RTB"
    value       = module.vpc_virginia.vpc_private_route_table
}

# Oregon
output "oregon_vpc_id" {
    description = "oregon VPC Id"
    value       = module.vpc_oregon.vpc_id
}

output "oregon_cidr_block" {
    description = "oregon VPC Cidr Block"
    value       = module.vpc_oregon.vpc_cidr_block"
}

output "oregon_public_subnet_id" {
    description = "oregon Public Subnet Id"
    value       = module.vpc_oregon.vpc_public_id
}

output "oregon_private_subnet_id" {
    description = "oregon Private Subnet Id"
    value       = module.vpc_oregon.vpc_private_id
}

output "oregon_public_subnet_cidr" {
    description = "oregon Public Subnet CIDR"
    value       = module.vpc_oregon.vpc_public_cidr_block
}

output "oregon_private_subnet_cidr" {
    description = "oregon Private Subnet CIDR"
    value       = module.vpc_oregon.vpc_private_cidr_block
}

output "oregon_public_rtb" {
    description = "oregon Public RTB"
    value       = module.vpc_oregon.vpc_public_route_table
}

output "oregon_private_rtb" {
    description = "oregon Private RTB"
    value       = module.vpc_oregon.vpc_private_route_table
}