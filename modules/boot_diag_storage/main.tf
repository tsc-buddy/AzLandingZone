###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "diag-st"
  location       = var.location
  environment  = var.environment
  location_short           = var.location_short
  tags         = var.tags
}


#diagnostic storage account

module "diagnostic_storage_account" {
  source                   = "../../resources/storage/storage_account"
  resource_group           = module.resource_group.name
  location                   = module.resource_group.location
  environment              = var.environment
  location_short           = var.location_short
  name_prefix              = "stdiag"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
