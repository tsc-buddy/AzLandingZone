###
#  module composition
###

#resource group

module "resource_group" {
  source              = "../../resources/base/resource_group"
  service_name        = "bastion"
  location            = var.location
  location_short      = var.location_short
  environment         = var.environment
  tags                = var.tags
}

module "public_ip" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  location          = module.resource_group.location
  environment       = var.environment
  location_short    = var.location_short
  name_prefix       = "pip-bastion"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "bastion" {
  source                         = "../../resources/network/bastion_host"
  resource_group                 = module.resource_group.name
  location                       = module.resource_group.location
  location_short                 = var.location_short
  address_prefix_bastion         = var.address_prefix_bastion
  environment                    = var.environment
  virtual_network_name           = var.virtual_network_name
  virtual_network_resource_group = var.virtual_network_resource_group
  public_ip_address_id           = module.public_ip.id
  tags                           = var.tags
}