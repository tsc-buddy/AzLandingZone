###
#  module outputs
###

output "virtual_network_name" {
  value       = module.virtual_network.name
  description = "resource name of virtual network"
}

output "virtual_network_id" {
  value       = module.virtual_network.id
  description = "resource id of virtual network"
}

output "virtual_network_resource_group_name" {
  value = module.virtual_network.resource_group_name
}


output "nsg_app01_id" {
  value = module.network_security_group_app01.id
}

output "nsg_app02_id" {
  value = module.network_security_group_app02.id
}