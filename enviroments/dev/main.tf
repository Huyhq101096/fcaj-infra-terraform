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


module "sg_linux_ec2" {
  source = "../../modules/terraform-aws-security-group"

  name        = "${local.name}-linux-sg"
  description = "Security group for Linux EC2"
  vpc_id      = module.vpc_linux.vpc_id

  # 1. Inbound Rules [1]
  ingress_with_cidr_blocks = [
    {
      from_port   = var.ssh_port
      to_port     = var.ssh_port
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.http_port
      to_port     = var.http_port
      protocol    = "tcp"
      description = "HTTP access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      description = "HTTPS access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.nodejs_app_port
      to_port     = var.nodejs_app_port
      protocol    = "tcp"
      description = "Node.js app"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    }
  ]

  # 2. Outbound Rules [2]
  egress_rules = ["all-all"]

  # 3. Tags [2][3]
  tags = merge(local.common_tags, {
    Name = "${local.name}-linux-sg"
  })


}




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

module "sg_windows_ec2" {
  source = "../../modules/terraform-aws-security-group"

  name        = "${local.name}-windows-sg"
  description = "Security group for Windows EC2"
  vpc_id      = module.vpc_windows.vpc_id

  # Inbound Rules
  ingress_with_cidr_blocks = [
    {
      from_port   = var.ssh_port
      to_port     = var.ssh_port
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.http_port
      to_port     = var.http_port
      protocol    = "tcp"
      description = "HTTP access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      description = "HTTPS access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.rdp_port
      to_port     = var.rdp_port
      protocol    = "tcp"
      description = "RDP access"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      description = "ICMP IPv4"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "58"
      description = "ICMP IPv6"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.nodejs_app_port
      to_port     = var.nodejs_app_port
      protocol    = "tcp"
      description = "Node.js app"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    },
    {
      from_port   = var.mysql_port
      to_port     = var.mysql_port
      protocol    = "tcp"
      description = "MySQL/Aurora"
      cidr_blocks = join(",", var.allowed_cidr_blocks)
    }
  ]

  # Outbound Rules
  egress_rules = ["all-all"]

  tags = merge(local.common_tags, {
    Name = "${local.name}-windows-sg"
    OS   = "windows"
  })
}