aws_region   = "ap-southeast-1"
project_name = "fcaj"
environment  = "dev"

azs = [
  "ap-southeast-1a",
  "ap-southeast-1b"
]

vpc_linux_cidr   = "10.0.0.0/16"
vpc_windows_cidr = "10.1.0.0/16"


linux_public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
linux_private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]


windows_public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
windows_private_subnets = ["10.1.11.0/24", "10.1.12.0/24"]


enable_nat_gateway = true
single_nat_gateway = true