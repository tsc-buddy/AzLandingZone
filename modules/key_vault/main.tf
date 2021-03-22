###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "kv"
  location       = var.location
  environment  = var.environment
  location_short           = var.location_short
  tags         = var.tags
}

module "key_vault" {
  source         = "../../resources/key_vault/key_vault"
  resource_group = module.resource_group.name
  location         = module.resource_group.location
  environment    = var.environment
  location_short           = var.location_short
  sku_name       = var.sku_name
  tags           = var.tags
}

module "key_vault_access_policy" {
  source       = "../../resources/key_vault/key_vault_access_policy"
  key_vault_id = module.key_vault.id
  object_id    = var.object_id
  certificate_permissions = [
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "setissuers",
    "update",
  ]
  key_permissions = [
    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]
  secret_permissions = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]

}