module "subnets_public" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.ip_network_public
  networks = [
    {
      name     = "firewall"
      new_bits = 12
    }
  ]
}

module "subnets_management" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.ip_network_management
  networks = [
    {
      name     = "firewall"
      new_bits = 12
    }
  ]
}

module "subnets_private" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.ip_network_private
  networks = [
    {
      name     = "firewall"
      new_bits = 7
    },
    {
      name     = "cicd"
      new_bits = 7
    },
    {
      name     = "secops"
      new_bits = 7
    },
    {
      name     = "dmz"
      new_bits = 7
    }
  ]
}