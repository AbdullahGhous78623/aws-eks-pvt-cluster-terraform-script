#####################################
# VPC Module
#####################################
module "vpc" {
  source              = "./modules/vpc"
  cluster_name        = var.cluster_name
  vpc_cidr            = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones  = var.availability_zones
}

#####################################
# IAM Module
#####################################
module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

#####################################
# Security Groups Module
#####################################
module "security_groups" {
  source       = "./modules/security-groups"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
}

#####################################
# VPC Endpoints Module
#####################################
module "vpc_endpoints" {
  source             = "./modules/vpc-endpoints"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = var.vpc_cidr
  aws_region         = var.aws_region
  route_table_ids    = [module.vpc.public_rt_id, module.vpc.private_rt_id]
  private_subnet_ids = module.vpc.private_subnet_ids
}

#####################################
# EKS Module
#####################################
module "eks" {
  source                 = "./modules/eks"
  cluster_name           = var.cluster_name
  cluster_version        = var.cluster_version
  aws_region             = var.aws_region
  private_subnet_ids     = module.vpc.private_subnet_ids
  cluster_role_arn       = module.iam.cluster_role_arn
  node_role_arn          = module.iam.node_role_arn
  node_group_desired     = var.node_group_desired
  node_group_min         = var.node_group_min
  node_group_max         = var.node_group_max
  node_group_instance_types = var.node_group_instance_types
}
