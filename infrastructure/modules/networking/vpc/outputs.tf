output "vpc_id" {
    description = "VPC ID"
    value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
    description = "VPC CIDR Block"
    value       = aws_vpc.main.cidr_block
}

output "vpc_public_id" {
    description = "Public Subnet Id"
    value       = [for s in aws_subnet.public : s.id]
}

output "vpc_private_id" {
    description = "Private Subnet Id"
    value       = [for s in aws_subnet.private : s.id]
}

output "vpc_public_cidr_block" {
    description = "Public Subnet Cidr Block"
    value       = [for s in aws_subnet.public : s.cidr_block]
}

output "vpc_private_cidr_block" {
    description = "Private Subnet Cidr Block"
    value       = [for s in aws_subnet.private : s.cidr_block]
}

output "vpc_public_route_table" {
    description = "Publc Route Table"
    value       =  aws_route_table.public.id
}

output "vpc_private_route_table" {
    description = "Private Route Table"
    value       =  aws_route_table.private.id
}