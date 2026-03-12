output "linux_vpc_id" {
  value = module.vpc_linux.vpc_id
}

output "windows_vpc_id" {
  value = module.vpc_windows.vpc_id
}

output "linux_public_subnets" {
  value = module.vpc_linux.public_subnets
}

output "windows_public_subnets" {
  value = module.vpc_windows.public_subnets
}