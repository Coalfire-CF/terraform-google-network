![Coalfire](coalfire_logo.png)


# Google Cloud Network Terraform Module

## Description

This module makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax. This module will create:

- Shared VPC Network
- Subnets
- Routing
- Firewall rules
- Network peering

Coalfire has tested this module with Terraform version 1.5.0 and the Hashicorp Google provider versions 4.70 - 5.0.

FedRAMP Compliance: Moderate, High

### Usage

```
module "public_network" {
    source = "github.com/Coalfire-CF/terraform-google-network"

    project_id = "your_project_id"
    network_name = "${var.vpc_prefix}-public"

    subnets = [
        {
            subnet_name = "${var.subnet_prefix}-public-firewall"
            subnet_ip = module.subnets_public.network_cidr_blocks["firewall"]
            subnet_region = var.region
        }
    ]
}
```

