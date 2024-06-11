terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

module "vpc_module" {
  source     = "../vpc_module"
  cidr_block = var.vpc_cidr_block
}

module "ig_module" {
  source = "../ig_module"
  vpc_id = module.vpc_module.vpc_id
}

module "eip_module" {
  source = "../eip_module"
}

module "subnet_module" {
  source               = "../subnet_module"
  vpc_id               = module.vpc_module.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_azs    = var.public_subnet_azs
  private_subnet_azs   = var.private_subnet_azs
}


module "nat_module" {
  source              = "../nat_module"
  eip_id              = module.eip_module.eip_id
  subnet_id           = module.subnet_module.pub_sub1_id
  internet_gateway_id = module.ig_module.internet_gateway_id
}


module "public_rt_module" {
  source              = "../public_rt_module"
  vpc_id              = module.vpc_module.vpc_id
  internet_gateway_id = module.ig_module.internet_gateway_id
  public_subnet_ids = [
    module.subnet_module.pub_sub1_id,
    module.subnet_module.pub_sub2_id,
    module.subnet_module.pub_sub3_id
  ]
}

module "private_rt_module" {
  source         = "../private_rt_module"
  vpc_id         = module.vpc_module.vpc_id
  nat_gateway_id = module.nat_module.nat_gw_id
  private_subnet_ids = [
    module.subnet_module.priv_sub1_id,
    module.subnet_module.priv_sub2_id,
    module.subnet_module.priv_sub3_id
  ]
}

module "sg_module" {
  source = "../sg_module"
  vpc_id = module.vpc_module.vpc_id
}

module "db_subnet_group_module" {
  source = "../db_subnet_group_module"
  private_subnet_ids = [
    module.subnet_module.priv_sub1_id,
    module.subnet_module.priv_sub2_id,
    module.subnet_module.priv_sub3_id
  ]
}

module "db_instance_module" {
  source                = "../db_instance_module"
  db_username           = "admin"
  db_password           = "adminadmin"
  db_subnet_group_name  = module.db_subnet_group_module.db_subnet_group_name
  rds_security_group_id = module.sg_module.rds_security_group_id
}

output "rds_endpoint" {
  value = module.db_instance_module.rds_endpoint
}

module "ec2_module" {
  source            = "../ec2_module"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.existing_key_name
  security_group_id = module.sg_module.security_group_id
  subnet_id         = module.subnet_module.pub_sub1_id
  rds_endpoint      = module.db_instance_module.rds_endpoint
  db_name           = "mydb"
}


