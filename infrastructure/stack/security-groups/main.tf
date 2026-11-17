provider "aws" {
	alias 	= "virginia"
	region  = var.aws_region_1
}

provider "aws" {
	alias   = "oregon"
	region  = var.aws_region_2
}

data "terraform_remote_state" "vpc" {
	backend = "local"
	config {
		path = "../vpc/terraform.tfstate"
	}
}

locals {
	security_group_rules = {
		sg_lambda = {
			ingress = {
				http = {
					from_port  = 80
					to_port    = 80
					protocol   = "tcp"
					cidr_blocks = [data.terraform_remote_state.vpc.virginia_vpc_cidr]
				}
			}
			egress = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"]
				}
			}
		}
		sg_rds = {
			ingress = {
				vpc_oregon = {
					from_port  = 5432
					to_port    = 5432
					protocol   = "tcp"
					cidr_blocks = [data.terraform_remote_state.vpc.oregon_vpc_cidr]
				}
				lambda = {
					from_port  = 5432
					to_port	   = 5432
					protocol   = "tcp"
					security_group_id = module.sg_lambda.security_id
				}
			}
			egress  = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"] 
				}
			}
		}
		sg_alb_virginia = {
			ingress = {
				http = {
					from_port  = 80
					to_port    = 80
					protocol   = "tcp"
					cidr_blocks = ["0.0.0.0/0"]
				}
				https = {
					from_port  = 443
					to_port    = 443
					protocol   = "tcp"
					cidr_blocks = ["0.0.0.0/0"]
				}
			}
			egress = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"] 
				}
			}
		}
		sg_ec2_virginia = {
			ingress = {
				http = {
					from_port  = 80
					to_port    = 80
					protocol   = "tcp"
					security_group_id = module.sg_alb_virginia.security_id
				}
			}
			egress = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"] 
				}
			}
		}
		sg_alb_oregon = {
			ingress = {
				http = {
					from_port  = 80
					to_port    = 80
					protocol   = "tcp"
					cidr_blocks = [data.terraform_remote_state.vpc.virginia_vpc_cidr]
				}
				https = {
					from_port  = 443
					to_port    = 443
					protocol   = "tcp"
					cidr_blocks = [data.terraform_remote_state.vpc.virginia_vpc_cidr]
				}
			}
			egress = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"] 
				}
			}
		}
		sg_ec2_oregon 	= {
			ingress = {
				express = {
					from_port  = 3000
					to_port    = 3000
					protocol   = "tcp"
					security_group_id = module.sg_alb_oregon.security_id
				}
				nestJs = {
					from_port  = 5000
					to_port    = 5000
					protocol   = "tcp"
					security_group_id = module.sg_alb_oregon.security_id
				}
			}
			egress = {
				all = {
					from_port  = 0
					to_port    = 0
					protocol   = -1
					cidr_blocks = ["0.0.0.0/0"] 
				}
			}
		}
	}
}

module "sg_lambda" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.virginia
	}
	
	sg_name 	= var.sg_lambda
	sg_description  = var.sg_lambda_description
	vpc_id		= terraform_remote_state.vpc.virginia_vpc_id
	ingress = locals.security_group_rules.sg_lambda.ingress
	egress  = locals.security_group_rules.sg_lambda.egress

}
 
module "sg_rds" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.virginia
	}
	
	sg_name 	= var.sg_rds_name
	sg_description  = var.sg_rds_description
	vpc_id		= terraform_remote_state.vpc.virginia_vpc_id
	ingress = locals.security_group_rules.sg_rds.ingress
	egress  = locals.security_group_rules.sg_rds.egress
	
	depends_on = [module.sg_lambda]
}

module "sg_alb_virginia" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.virginia
	}
	
	sg_name 	= var.sg_alb_virginia_name
	sg_description  = var.sg_alb_virginia_description
	vpc_id		= terraform_remote_state.vpc.virginia_vpc_id
	ingress = locals.security_group_rules.sg_alb_virginia.ingress
	egress  = locals.security_group_rules.sg_alb_virginia.egress
}

module "sg_ec2_virginia" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.virginia
	}
	
	sg_name 	= var.sg_ec2_virginia_name
	sg_description  = var.sg_ec2_virginia_description
	vpc_id		= terraform_remote_state.vpc.virginia_vpc_id
	ingress = locals.security_group_rules.sg_ec2_virginia.ingress
	egress  = locals.security_group_rules.sg_ec2_virginia.egress
	
	depends_on = [module.sg_alb_virginia]
}

module "sg_alb_oregon" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.oregon
	}
	
	sg_name 	= var.sg_alb_oregon_name
	sg_description  = var.sg_alb_oregon_description
	vpc_id		= terraform_remote_state.vpc.oregon_vpc_id
	ingress = locals.security_group_rules.sg_alb_oregon.ingress
	egress  = locals.security_group_rules.sg_alb_oregon.egress
}

module "sg_ec2_oregon" {
	source = "../../modules/networking/security"
	providers = {
		aws = aws.oregon
	}
	
	sg_name 	= var.sg_ec2_oregon_name
	sg_description  = var.sg_ec2_oregon_description
	vpc_id		= terraform_remote_state.vpc.oregon_vpc_id
	ingress = locals.security_group_rules.sg_ec2_oregon.ingress
	egress  = locals.security_group_rules.sg_ec2_oregon.egress
	
	depends_on = [module.sg_alb_oregon]
}
