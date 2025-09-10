variable "aws_region" {
  type    = string
  default = "sa-east-1" # Change as needed
}

variable "cluster_name" {
  type    = string
  default = "private-eks-cluster1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = [] # auto-pick if empty
}

variable "node_group_instance_types" {
  type    = list(string)
  default = ["t2.medium"]
}

variable "node_group_desired" {
  type    = number
  default = 2
}

variable "node_group_min" {
  type    = number
  default = 1
}

variable "node_group_max" {
  type    = number
  default = 3
}

variable "cluster_version" {
  type    = string
  default = "1.28"
}
