###
# environment outputs
###


output "network_name" {
  value       = module.network_spoke.virtual_network_name
  description = "Generated name of the dev virtual network"
}

output "network_id" {
  value       = module.network_spoke.virtual_network_id
  description = "Resource id of the dev virtual network"
}

output "network_resource_group_name" {
  value       = module.network_spoke.virtual_network_resource_group_name
  description = "Generated name of the resource group for the dev virtual network"
}

output "nsg_app01_id" {
  value       = module.network_spoke.nsg_app01_id
  description = "Resource id of the app01 nsg"
}

output "nsg_app02_id" {
  value       = module.network_spoke.nsg_app02_id
  description = "Resource id of the app02 nsg"
}

