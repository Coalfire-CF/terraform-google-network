# Google Cloud Network Routes Terraform Module

This submodule creates the individual vpc routes and optionally deletes the default internet gateway routes.

It supports creating:

- Routes within vpc network.
- Optionally deletes the default internet gateway routes.

## Usage Example

```hcl
module "routes" {
  source = "github.com/Coalfire-CF/terraform-google-network/modules/routes"
  network_name = var.network_name
  project_id   = var.project_id
  routes = [
    {
      name              = "route1"
      description       = "route1"
      destination_range = "10.0.0.0/16"
      priority          = "1000"
      next_hop_ip       = "10.10.20.12"
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.70, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.70, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_route.route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network where routes will be created | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the routes will be created | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | List of routes being created in this VPC | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_routes"></a> [routes](#output\_routes) | The created routes resources |
<!-- END_TF_DOCS -->
