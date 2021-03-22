###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "rsv"
  location       = var.location
  environment  = var.environment
  location_short           = var.location_short
  tags            =  var.tags
}


module "recovery_services" {
  source         = "../../resources/recovery_services/recovery_services_vault"
  resource_group = module.resource_group.name
  location         = module.resource_group.location
  environment    = var.environment
  location_short           = var.location_short
  name_prefix    = "rsv"
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  tags           = var.tags
}