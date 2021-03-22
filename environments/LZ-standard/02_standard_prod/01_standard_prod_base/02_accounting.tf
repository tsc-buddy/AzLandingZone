###
# Accounting details
###

module "key_vault" {
  source      = "../../../../modules/key_vault"
  environment = var.environment
  location      = var.location
  location_short           = var.location_short
  object_id   = var.object_id
  tags        = var.tags
}

module "boot_diag_storage" {
  source      = "../../../../modules/boot_diag_storage"
  environment = var.environment
  location      = var.location
  location_short           = var.location_short
  tags        = var.tags
}

module "audit_logs" {
  source      = "../../../../modules/audit_logs"
  environment = var.environment
  location      = var.location
  location_short           = var.location_short
   tags        = var.tags
}