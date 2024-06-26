# Google Cloud Network Firewall Rules Terraform Module

This module allows creation of custom VPC firewall rules.

# Usage Example

```hcl
module "firewall-rules" {
  source = "github.com/Coalfire-CF/terraform-google-network/modules/firewall-rules"
  network_name = var.network_name
  project_id   = var.project_id
  rules = [{
    name        = "allow-ssh-ingress"
    description = "allow-ssh-ingress"
    direction   = "INGRESS"
    priority    = 1000
    ranges                  = ["10.0.0.0/8"]
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
  }]
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
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the network this set of firewall rules applies to. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id of the project that holds the network. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | List of custom rule definitions (refer to variables file for syntax). | <pre>list(object({<br>    name                    = string<br>    description             = optional(string)<br>    direction               = optional(string)<br>    priority                = optional(number)<br>    ranges                  = optional(list(string))<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })))<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })))<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_rules"></a> [firewall\_rules](#output\_firewall\_rules) | The created firewall rule resources |
<!-- END_TF_DOCS -->
