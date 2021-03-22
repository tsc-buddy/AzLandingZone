###
# Environment outputs
###

output "network_hub_name" {
  value       = module.network_hub.virtual_network_name
  description = "Generated name of the hub virtual network"
}

output "network_hub_id" {
  value       = module.network_hub.virtual_network_id
  description = "Resource id of the  hub virtual network"
}

output "network_hub_resource_group_name" {
  value       = module.network_hub.virtual_network_resource_group_name
  description = "Generated name of the resource group for the  hub virtual network"
}




output "nsg_app01_id" {
  value       = module.network_hub.nsg_app01_id
  description = "Resource id of the app01 nsg"
}

output "nsg_app02_id" {
  value       = module.network_hub.nsg_app02_id
  description = "Resource id of the app02 nsg"
}


# output "virtual_machine_id" {
#   value       = module.domain_controllers.*.virtual_machine_id
#   description = "The ID of the Windows Virtual Machine."
# }
