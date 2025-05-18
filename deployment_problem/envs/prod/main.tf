

locals {
  vpc_name                = "${var.client_name}_vpc"
  internet_gateway_name   = "${var.client_name}_ig"
  subnet_name             = "${var.client_name}_${var.environment}_subnet"
  securitygroup_name      = "${var.client_name}_${var.environment}_securitygroup"
  ec2_name                = "${var.client_name}_${var.environment}_ec2instance"
  default_tags            = {
                            "Environment" = "${var.environment}",
                            "Client"      = "${var.client_name}",
                            "Project"     = "${var.project_name}",
                        }

  ip_range_to_allow_ingress = ["186.122.9.9/32"]  #put your ip address here to ssh to server
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.0"  # Specify the desired version here
    }
  }
}

provider "aws" {
  
  region = var.provider_region
#  access_key = var.provider_accesskey     ENV VARS IN CODE BUILD
#  secret_key = var.provider_secretkey
}


module "vpc" {
  source = "../../modules/vpc"
  vpc_block = var.vpc_block
  vpc_name   = local.vpc_name
  internet_gateway_name   = local.internet_gateway_name
  default_tags       = local.default_tags
}


module "subnet" {
  source = "../../modules/subnet"
  vpc_id                  = module.vpc.vpc_id
  routetable_id           = module.vpc.rt_id
  subnet_block            = var.subnet_block
  availability_zone       = var.availability_zone
  subnet_name             = local.subnet_name
  default_tags       = local.default_tags
}

module "securitygroup" {
  source = "../../modules/securitygroup"
  vpc_id                  = module.vpc.vpc_id
  securitygroup_name      = local.securitygroup_name
  block_allow_ingress     = local.ip_range_to_allow_ingress
  default_tags            = local.default_tags
}

module "ec2instance" {
  source = "../../modules/ec2instance"
  
  subnet_id              = module.subnet.sn_id
  securitygroup_id = module.securitygroup.sg_id

  ec2_imageid            = var.ec2_imageid
  ec2_instancetype       = var.ec2_instancetype
  ec2_decryptkeyname     = var.ec2_decryptkeyname
  ec2_name               = local.ec2_name
  ec2_disksize           = var.ec2_disksize
  ec2_disktype           = var.ec2_disktype
  default_tags           = local.default_tags 
}
