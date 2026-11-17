terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

module "vpc" {
    source = "../../modules/networking/vpc"

    aws_region = var.aws_region
    cidr_block = var.cidr_block
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone = ["${var.aws_region}a", "${var.aws_region}b"]
}