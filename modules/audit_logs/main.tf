###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "logs"
  location       = var.location
  environment  = var.environment
  location_short           = var.location_short
  tags         = var.tags
}

module "log_analytics" {
  source            = "../../resources/log_analytics/log_analytics"
  name_prefix       = "log"
  resource_group    = module.resource_group.name
  location            = module.resource_group.location
  environment       = var.environment
  location_short           = var.location_short
  sku               = "PerGB2018"
  retention_in_days = 30
  tags              = var.tags
}

module "archive_storage_account" {
  source                   = "../../resources/storage/storage_account"
  resource_group           = module.resource_group.name
  location                   = module.resource_group.location
  location_short           = var.location_short
  environment              = var.environment
  name_prefix              = "starchive"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}