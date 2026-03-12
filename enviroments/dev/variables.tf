variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "vpc_linux_cidr" {
  type = string
}

variable "vpc_windows_cidr" {
  type = string
}

variable "linux_public_subnets" {
  type = list(string)
}

variable "linux_private_subnets" {
  type = list(string)
}

variable "windows_public_subnets" {
  type = list(string)
}

variable "windows_private_subnets" {
  type = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use single NAT Gateway"
  type        = bool
  default     = true
}