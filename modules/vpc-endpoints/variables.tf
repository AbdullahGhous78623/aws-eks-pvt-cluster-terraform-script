variable "cluster_name" {}
variable "vpc_id" {}
variable "vpc_cidr" {}
variable "aws_region" {}
variable "route_table_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "interface_endpoints" {
  type    = list(string)
  default = ["ecr.api", "ecr.dkr", "sts", "logs", "ec2"]
}
