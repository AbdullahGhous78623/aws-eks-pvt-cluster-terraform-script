variable "cluster_name" {}
variable "cluster_version" { default = "1.29" }
variable "aws_region" {}
variable "private_subnet_ids" { type = list(string) }
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "node_group_desired" { default = 2 }
variable "node_group_min" { default = 1 }
variable "node_group_max" { default = 3 }
variable "node_group_instance_types" { type = list(string) }
variable "depends_on_eks" {
  type    = list(any)
  default = []
}
