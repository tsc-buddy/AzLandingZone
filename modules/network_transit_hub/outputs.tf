###
#  module outputs
###

output "virtual_network_name" {
  value       = module.virtual_network.name
  description = "The name of the virtual network."
}

output "virtual_network_id" {
  value       = module.virtual_network.id
  description = "The virtual NetworkConfiguration ID."
}

output "virtual_network_resource_group_name" {
  value       = module.virtual_network.resource_group_name
  description = "The name of the resource group of the virtual network."
}


# output "firewall_resource_group_name" {
#   value       = module.firewall.resource_group_name
#   description = "The name of the Azure Firewall."
# }

output "firewall_name" {
  value       = module.firewall.firewall_name
  description = "The name of the Azure Firewall."
}

output "firewall_id" {
  value       = module.firewall.id
  description = "The Id of the Azure Firewall."
}

output "vgw_id" {
  value       = module.virtual_network_gateway.id
  description = "The Id of the Virtual Network Gateway."
}

output "private_ip_address" {
  value       = module.firewall.private_ip_address
  description = "The private IP address of the Azure Firewall."
}

output "route_table_id" {
  value       = module.route_table.id
  description = "The Id of the Route Table."
}


output "nsg_app01_id" {
  value = module.network_security_group_app01.id
}

output "nsg_app02_id" {
  value = module.network_security_group_app02.id
}


output "fw_pip_id" {
  value = module.public_ip_fw.id
}

output "vgw_pip_id" {
  value = module.public_ip_vgw.id
}





# output "virtual_network_gateway_id" {
#   value       = module.virtual_network_gateway.id
#   description = "The ID of the Virtual Network Gateway."
# }

# output "firewall_id" {
#   value       = module.firewall.id
#   description = "The Resource ID of the Azure Firewall."
# }

# output "firewall_private_ip_address" {
#   value       = module.firewall.private_ip_address
#   description = "The private IP address of the Azure Firewall."
# }