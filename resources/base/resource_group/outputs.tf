###
# resource outputs
###

output "name" {
  value       = azurerm_resource_group.base.name
  description = "The Name of this Resource Group."
}

output "id" {
  value       = azurerm_resource_group.base.id
  description = "The ID of the Resource Group."
}

output "location" {
  value       = azurerm_resource_group.base.location
  description = "The location of the Resource Group."
}