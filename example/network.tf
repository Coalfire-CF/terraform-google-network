module "public" {
  source = "github.com/Coalfire-CF/terraform-google-network?ref=v1.0.8"

  project_id   = var.project_id
  network_name = "${var.vpc_prefix}-public"

  subnets = [
    {
      subnet_name   = "${var.subnet_prefix}-public-firewall"
      subnet_ip     = module.subnets_public.network_cidr_blocks["firewall"]
      subnet_region = var.region
    }
  ]
}

module "management" {
  source = "github.com/Coalfire-CF/terraform-google-network?ref=v1.0.8"

  project_id   = var.project_id
  network_name = "${var.vpc_prefix}-mgmt-fw"

  subnets = [
    {
      subnet_name   = "${var.subnet_prefix}-management-firewall"
      subnet_ip     = module.subnets_management.network_cidr_blocks["firewall"]
      subnet_region = var.region
    }
  ]
}

module "private" {
  source = "github.com/Coalfire-CF/terraform-google-network?ref=v1.0.8"

  project_id   = var.project_id
  network_name = "${var.vpc_prefix}-mgmt"

  subnets = [
    {
      subnet_name   = "${var.subnet_prefix}-private-firewall"
      subnet_ip     = module.subnets_private.network_cidr_blocks["firewall"]
      subnet_region = var.region
    },
    {
      subnet_name   = "${var.subnet_prefix}-private-cicd"
      subnet_ip     = module.subnets_private.network_cidr_blocks["cicd"]
      subnet_region = var.region
    },
    {
      subnet_name   = "${var.subnet_prefix}-private-secops"
      subnet_ip     = module.subnets_private.network_cidr_blocks["secops"]
      subnet_region = var.region
    },
    {
      subnet_name   = "${var.subnet_prefix}-private-dmz"
      subnet_ip     = module.subnets_private.network_cidr_blocks["dmz"]
      subnet_region = var.region
    }
  ]
}

