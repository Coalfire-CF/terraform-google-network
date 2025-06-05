variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "state_bucket" {
  description = "Name of the state bucket"
  type        = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "ip_network_public" {
  description = "Network part of public CIDR"
  type        = string
}

variable "ip_network_management" {
  description = "Network part of management CIDR"
  type        = string
}

variable "ip_network_private" {
  description = "Network part of management CIDR"
  type        = string
}

variable "remote_access_cidrs" {
  description = "List of IPv4 CIDR ranges to access all admins remote access"
  type        = list(string)
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "vpc_prefix" {
  description = "Prefix for VPCs."
  type        = string
}

variable "subnet_prefix" {
  description = "Prefix for subnets."
  type        = string
}

variable "firewall_prefix" {
  description = "Prefix for firewall rules."
  type        = string
}

variable "router_prefix" {
  description = "Prefix for router."
  type        = string
}

variable "nat_prefix" {
  description = "Prefix for NAT."
  type        = string
}

variable "peer_prefix" {
  description = "Prefix for peering."
  type        = string
}
