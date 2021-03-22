###
# resource composition
###

#network security group

resource "azurerm_network_security_group" "base" {
  name                = "${var.name_prefix}-${var.policy_name}-${var.environment}-${var.location_short}"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}