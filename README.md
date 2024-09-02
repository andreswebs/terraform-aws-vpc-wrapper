# terraform-aws-vpc-wrapper

Wrapper around the community AWS VPC module

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "network" {
  source       = "github.com/andreswebs/terraform-aws-vpc-wrapper"
  network_name = var.network_name
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | n/a | `string` | `null` | no |
| <a name="input_network_cidr_ipv4"></a> [network\_cidr\_ipv4](#input\_network\_cidr\_ipv4) | n/a | `string` | `"10.20.8.0/21"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs_ipv4"></a> [private\_subnet\_cidrs\_ipv4](#input\_private\_subnet\_cidrs\_ipv4) | n/a | `list(string)` | <pre>[<br>  "10.20.8.0/24",<br>  "10.20.9.0/24",<br>  "10.20.10.0/24"<br>]</pre> | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_public_subnet_cidrs_ipv4"></a> [public\_subnet\_cidrs\_ipv4](#input\_public\_subnet\_cidrs\_ipv4) | n/a | `list(string)` | <pre>[<br>  "10.20.11.0/24",<br>  "10.20.12.0/24",<br>  "10.20.13.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | n/a | `bool` | `false` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.1 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

[//]: # (END_TF_DOCS)