output "networks" {
  value       = tolist(module.subnets.networks)
  description = "A list of network objects with name, az, hosts, and cidr_block."
}

output "network_cidr_blocks" {
  value       = module.subnets.network_cidr_blocks
  description = "A map from network names to allocated address prefixes in CIDR notation."
}

output "base_cidr_block" {
  value       = module.subnets.base_cidr_block
  description = "The base CIDR block for the VPC"

}