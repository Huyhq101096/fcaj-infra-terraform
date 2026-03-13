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

# Port variables for security group configuration
variable "ssh_port" {
  description = "Port number for SSH access to Linux EC2 instances"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Port number for HTTP access to web applications"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port number for HTTPS access to web applications"
  type        = number
  default     = 443
}

variable "nodejs_app_port" {
  description = "Port number for Node.js application"
  type        = number
  default     = 5000
}

variable "rdp_port" {
  description = "Port number for RDP access to Windows EC2 instances"
  type        = number
  default     = 3389
}

variable "mysql_port" {
  description = "Port number for MySQL/Aurora database access"
  type        = number
  default     = 3306
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the security group. Default allows access from anywhere (use with caution in production)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}