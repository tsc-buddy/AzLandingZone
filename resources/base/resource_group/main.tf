###
# resource composition
###

#resource group

resource "azurerm_resource_group" "base" {
  name     = "${var.name_prefix}-${var.service_name}-${var.environment}-${var.location_short}"
  location = var.location
  tags     = var.tags
}