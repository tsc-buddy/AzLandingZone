###
# resource composition
###

#vnet

resource "azurerm_virtual_network" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.location_short}"
  resource_group_name = var.resource_group
  address_space       = var.address_space
  location            = var.location
  dns_servers         = var.dns_servers

  tags = var.tags

}

