###
# resource composition
###

#network interface

resource "azurerm_network_interface" "base" {
  count = var.nic_count

  name                          = "${var.name_prefix}-${format("%02d", count.index)}-${var.environment}-${var.location_short}"
  location                      = var.location
  resource_group_name           = var.resource_group
  dns_servers                   = var.dns_servers
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label

  ip_configuration {
    name                          = "ip-${var.name_prefix}-${format("%02d", count.index)}-${var.environment}-${var.location_short}"
    subnet_id                     = var.subnet_id
    private_ip_address_version    = var.private_ip_address_version
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
    primary                       = var.primary
    private_ip_address            = var.private_ip_address_allocation != "Static" ? null : element(var.private_ip_address, count.index)
  }
}