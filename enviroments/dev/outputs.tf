output "linux_vpc_id" {
  value = module.vpc_linux.vpc_id
}

output "windows_vpc_id" {
  value = module.vpc_windows.vpc_id
}

output "public_subnets" {
  value = module.vpc_linux.public_subnets
}


output "linux_key_pair_name" {
  value = module.linux_key_pair.key_pair_name
}
