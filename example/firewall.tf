module "private_vpc_fw" {
  source = "github.com/Coalfire-CF/terraform-google-network//modules/firewall-rules?ref=v1.0.8"

  project_id   = var.project_id
  network_name = module.private.network_name

  rules = [
    # IAP SSH Ingress
    {
      name                    = "allow-iap-ingress-vm"
      description             = "allow IAP ingress for VM"
      direction               = "INGRESS"
      priority                = 1
      ranges                  = ["35.235.240.0/20"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    },
    # External RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-private-vpc-ext-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-private-vpc-ext-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-private-vpc-ext-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    },
    # Internal RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-private-vpc-int-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-private-vpc-int-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-private-vpc-int-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    }
  ]
}

module "public_vpc_fw" {
  source = "github.com/Coalfire-CF/terraform-google-network//modules/firewall-rules?ref=v1.0.8"

  project_id   = var.project_id
  network_name = module.public.network_name

  rules = [
    # External RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-public-vpc-ext-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-public-vpc-ext-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-public-vpc-ext-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    },
    # Internal RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-public-vpc-int-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-public-vpc-int-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-public-vpc-int-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    }
  ]
}

module "management_vpc_fw" {
  source = "github.com/Coalfire-CF/terraform-google-network//modules/firewall-rules?ref=v1.0.8"

  project_id   = var.project_id
  network_name = module.management.network_name

  rules = [
    # External RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-management-vpc-ext-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-management-vpc-ext-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-management-vpc-ext-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = var.remote_access_cidrs
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["ext-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    },
    # Internal RDP, SSH & WinRM
    {
      name                    = "${var.firewall_prefix}-management-vpc-int-rdp"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-rdp"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-management-vpc-int-ssh"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-ssh"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
    },
    {
      name                    = "${var.firewall_prefix}-management-vpc-int-winrm"
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["10.2.0.0/16"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = ["int-winrm"]
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["5985", "5986"]
      }]
      deny = []
    }
  ]
}