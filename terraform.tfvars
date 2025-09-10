aws_region              = "sa-east-1"
cluster_name            = "private-eks-cluster1"

vpc_cidr                = "10.10.0.0/16"

public_subnets_cidrs    = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets_cidrs   = ["10.10.11.0/24", "10.10.12.0/24"]

availability_zones      = [] 

node_group_instance_types = ["t3.small"]
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3

cluster_version         = "1.28"
