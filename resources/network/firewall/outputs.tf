###
# resource outputs
###

output "id" {
  value       = azurerm_firewall.base.id
  description = "The Resource ID of the Azure Firewall."
}

output "resource_group_name" {
  value       = azurerm_firewall.base.resource_group_name
  description = "The Resource group name of the Azure Firewall."
}

output "firewall_name" {
  value       = azurerm_firewall.base.name
  description = "The name of the Azure Firewall."
}

output "private_ip_address" {
  value       = azurerm_firewall.base.ip_configuration.0.private_ip_address
  description = "The private IP address of the Azure Firewall."
}