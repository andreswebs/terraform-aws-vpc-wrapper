data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_index_strings = var.az_indexes == "" || var.az_indexes == null ? [] : [for item in split(",", var.az_indexes) : item]
  az_ids = var.az_indexes == "" || var.az_indexes == null ? [] : flatten([for idx_str in local.az_index_strings : [
    for az_id in data.aws_availability_zones.available.zone_ids : az_id if endswith(az_id, idx_str)
  ]])
  az_indexes = var.az_indexes == "" || var.az_indexes == null ? [] : [for az_id in local.az_ids : index(data.aws_availability_zones.available.zone_ids, az_id)]
  azs = var.az_indexes == "" || var.az_indexes == null ? slice(data.aws_availability_zones.available.names, 0, 3) : sort([
    for idx in local.az_indexes : data.aws_availability_zones.available.names[idx]
  ])

  is_eks = var.eks_cluster_name != null && var.eks_cluster_name != ""

  private_subnet_tags_eks = local.is_eks ? {
    "kubernetes.io/role/internal-elb"               = 1
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "karpenter.sh/discovery"                        = var.eks_cluster_name
  } : {}

  public_subnet_tags_eks = local.is_eks ? {
    "kubernetes.io/role/elb"                        = 1
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  } : {}

  private_subnet_tags = merge(
    local.private_subnet_tags_eks,
    var.private_subnet_tags,
  )

  public_subnet_tags = merge(
    local.public_subnet_tags_eks,
    var.public_subnet_tags,
  )

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.1"

  name                 = var.network_name
  cidr                 = var.network_cidr_ipv4
  azs                  = local.azs
  private_subnets      = var.private_subnet_cidrs_ipv4
  public_subnets       = var.public_subnet_cidrs_ipv4
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = var.single_nat_gateway

  private_subnet_tags = local.private_subnet_tags
  public_subnet_tags  = local.public_subnet_tags

}
