# Google Cloud Network Subnets Terraform Module

This submodule creates the individual vpc subnets.

It supports creating:

- Subnets within vpc network.

## Usage Example

```hcl
module "subnets" {
  source = "github.com/Coalfire-CF/terraform-google-network/modules/subnets"
  network_name = var.network_name
  project_id   = var.project_id
  subnets = [
    {
      subnet_name           = "gke-subnet"
      subnet_ip             = "10.10.40.0/24"
      subnet_region         = var.gcp_region
      subnet_private_access = true
    },
    {
      subnet_name           = "private-subnet"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.gcp_region
      subnet_private_access = true
    }
  ]
  secondary_ranges = {
    gke-subnet = [
      {
        range_name    = "us-east4-gke-01-services"
        ip_cidr_range = "192.50.0.0/16"
      },
      {
        range_name    = "us-east4--gke-01-pods"
        ip_cidr_range = "192.60.0.0/16"
      }
    ]
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network where subnets will be created | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where subnets will be created | `string` | n/a | yes |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The list of subnets being created | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The created subnet resources |
<!-- END_TF_DOCS -->
