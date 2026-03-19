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

output "windows_key_pair_name" {
  value = module.windows_key_pair.key_pair_name
}

# output "windows_private_key_pem" {
#   value     = module.windows_key_pair.private_key_pem
#   sensitive = true
# }


output "linux_key_pair_name" {
  value = module.linux_key_pair.key_pair_name
}
