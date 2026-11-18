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
  alias = "virginia"
  region = var.aws_region_1
}

provider "aws" {
  alias = "oregon"
  region = var.aws_region_2
}

module "vpc_virginia" {
    source              = "../../modules/networking/vpc"
    providers           = {
        aws = aws.virginia
    }

    aws_region_name     = "virginia"
    cidr_block          = var.virginia_cidr_block
    public_subnet_cidr  = var.virginia_public_subnet_cidr
    private_subnet_cidr = var.virginia_private_subnet_cidr
    availability_zone   = ["${var.aws_region_1}a", "${var.aws_region_1}b"]
}

module "vpc_oregon" {
    source              = "../../modules/networking/vpc"
    provider            = {
        aws = aws.oregon
    }

    aws_region_name     = "oregon"
    cidr_block          = var.oregon_cidr_block
    public_subnet_cidr  = var.oregon_public_subnet_cidr
    private_subnet_cidr = var.oregon_private_subnet_cidr
    availability_zone   = ["${var.aws_region_2}a", "${var.aws_region_2}b"]
}