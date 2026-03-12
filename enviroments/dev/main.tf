locals {
  name = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "huyhq1010"
  }
}

################################
# VPC Linux
################################

module "vpc_linux" {
  source = "../../modules/terraform-aws-vpc"

  name = "${local.name}-linux"
  cidr = var.vpc_linux_cidr

  azs             = var.azs
  public_subnets  = var.linux_public_subnets
  private_subnets = var.linux_private_subnets

  # enable_nat_gateway = var.enable_nat_gateway
  # single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    OS = "linux"
  })
}


# module sg_linux_ec2 {
#   source = "../../modules/terraform-aws-security-group"

#   name = "${local.name}-linux-sg"
#   description = "Security group for Linux EC2"
#   vpc_id      = module.vpc_linux.vpc_id


# }




################################
# VPC Window
################################

module "vpc_windows" {
  source = "../../modules/terraform-aws-vpc"

  name = "${local.name}-windows"
  cidr = var.vpc_windows_cidr

  azs             = var.azs
  public_subnets  = var.windows_public_subnets
  private_subnets = var.windows_private_subnets

  # enable_nat_gateway = var.enable_nat_gateway
  # single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    OS = "windows"
  })
}