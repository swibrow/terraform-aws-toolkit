output "networks" {
  value       = tolist(local.networks)
  description = "A list of network objects with name, az, hosts, and cidr_block."
}

output "network_cidr_blocks" {
  value       = tomap(local.network_by_name)
  description = "A map from network names to allocated address prefixes in CIDR notation."
}

output "base_cidr_block" {
  value       = var.base_cidr_block
  description = "The base CIDR block for the VPC"

}
