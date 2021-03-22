###
# Remote state storage account creation
###


resource "azurerm_resource_group" "state-rg" {
name        = "rg-terraformstate-${var.location_short}"
location      = var.region
}

resource "azurerm_storage_account" "state-sta" {
  name                      = "lzstatetf"
  resource_group_name       = azurerm_resource_group.state-rg.name
  location                  = azurerm_resource_group.state-rg.location
  account_kind              = "BlobStorage"
  account_tier              = "Standard"
  enable_https_traffic_only = true
  access_tier               = "Hot"
  account_replication_type  = "RAGRS"
    lifecycle {
    prevent_destroy = false
  }  
}

resource "azurerm_storage_container" "tfstate" {
  name                      = "tfstate"
  storage_account_name      = azurerm_storage_account.state-sta.name
  container_access_type     = "private"
}