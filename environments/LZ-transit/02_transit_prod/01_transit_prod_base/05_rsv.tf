
module "recovery_services" {
  source              = "../../../../modules/recovery_services"
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short
  tags                = var.tags
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
}
