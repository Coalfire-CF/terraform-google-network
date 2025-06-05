output "domain_name" {
  description = "Domain name"
  value       = var.domain_name
}

output "remote_access_cidrs" {
  description = "List of IPv4 CIDR ranges to access all admins remote access"
  value       = var.remote_access_cidrs
}

output "ip_network_private" {
  description = "Network part of private CIDR"
  value       = var.ip_network_private
}

output "subnets_private" {
  description = "Map of private subnet names and IDs"
  value       = zipmap([for name in module.private.subnets_names : replace(name, "${var.subnet_prefix}-private-", "")], module.private.subnets_ids)
}

output "subnets_private_cidr" {
  description = "Map of private subnet names and CIDRs"
  value       = zipmap([for name in module.private.subnets_names : replace(name, "${var.subnet_prefix}-private-", "")], module.private.subnets_ips)
}

output "network_private" {
  description = "Name of private network"
  value       = module.private.network_name
}

output "network_link_private" {
  description = "Self link of private network"
  value       = module.private.network_self_link
}

output "network_id" {
  value = module.private.network_id
}

