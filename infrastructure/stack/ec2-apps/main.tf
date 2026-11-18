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
	alias 	= "virginia"
	region  = var.aws_region_1
}

# tfstate for dynamis infrastructure
data "terraform_remote_state" "vpc" {
    backend = "local"
    config  = {
        path = "../vpc/terraform.tfstate"
    }
}

data "terraform_remote_state" "sg" {
    backend = "local"
    config  = {
        path = "../security-groups/terraform.tfstate"
    }
}

module "ec2_apps" {
    source = "../../modules/compute/ec2"

    ec2_name          = var.ec2_name
    subnet_id         = data.terraform_remote_state.vpc.virginia_public_subnet_id[0]
    user_data_path    = "./user-data.sh"
    vpc_sg_id         = [data.terraform_remote_state.sg.sg_ec2_virginia_id]
}