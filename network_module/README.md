## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.security_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet.subnet_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.subnet_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.assosiate_to_subnet_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.assosiate_to_subnet_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_address"></a> [network\_address](#input\_network\_address) | network address | `string` | n/a | yes |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | private subnet mask with prefix, example 192.168.1.0/25 | `string` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | public subnet mask with prefix, example 192.168.1.0/25 | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | location of resource group that contain the network resources | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of resource group that contain the network resources | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | map of subnets of the network | `map` | <pre>{<br>  "private": "private",<br>  "public": "public"<br>}</pre> | no |
| <a name="input_subnets_security_rules"></a> [subnets\_security\_rules](#input\_subnets\_security\_rules) | rules of all security groups | `map(any)` | <pre>{<br>  "allow_5432": {<br>    "access": "Allow",<br>    "destination_address_prefix": "192.168.1.132",<br>    "destination_port_range": "5432",<br>    "direction": "Inbound",<br>    "name": "allow 5432",<br>    "priority": 110,<br>    "protocol": "*",<br>    "source_address_prefix": "192.168.1.0/25",<br>    "source_port_range": "*",<br>    "type": "private"<br>  },<br>  "allow_port_8080": {<br>    "access": "Allow",<br>    "destination_address_prefix": "192.168.1.0/25",<br>    "destination_port_range": "8080",<br>    "direction": "Inbound",<br>    "name": "allow 8080",<br>    "priority": 110,<br>    "protocol": "*",<br>    "source_address_prefix": "*",<br>    "source_port_range": "*",<br>    "type": "public"<br>  },<br>  "deny_all": {<br>    "access": "Deny",<br>    "destination_address_prefix": "192.168.1.132",<br>    "destination_port_range": "*",<br>    "direction": "Inbound",<br>    "name": "deny all ports",<br>    "priority": 4096,<br>    "protocol": "*",<br>    "source_address_prefix": "*",<br>    "source_port_range": "*",<br>    "type": "private"<br>  },<br>  "private_ssh": {<br>    "access": "Allow",<br>    "destination_address_prefix": "192.168.1.132",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "allow SSH",<br>    "priority": 115,<br>    "protocol": "*",<br>    "source_address_prefix": "192.168.1.0/25",<br>    "source_port_range": "*",<br>    "type": "private"<br>  },<br>  "public_ssh": {<br>    "access": "Allow",<br>    "destination_address_prefix": "192.168.1.4",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "allow SSH",<br>    "priority": 100,<br>    "protocol": "*",<br>    "source_address_prefix": "79.178.217.173",<br>    "source_port_range": "*",<br>    "type": "public"<br>  }<br>}</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | virtual network name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_nsg"></a> [private\_nsg](#output\_private\_nsg) | output private nsg |
| <a name="output_private_subnet"></a> [private\_subnet](#output\_private\_subnet) | output the private subnet |
| <a name="output_public_nsg"></a> [public\_nsg](#output\_public\_nsg) | output public nsg |
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | output the public subnet |
| <a name="output_virtual_net"></a> [virtual\_net](#output\_virtual\_net) | output virtual network |
