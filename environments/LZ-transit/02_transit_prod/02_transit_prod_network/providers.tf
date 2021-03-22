###
# environment providers
###

terraform {
  required_version = "~> 0.13.0"
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_transit_prod_network.tfstate"
  }
}

provider "azurerm" {
subscription_id = var.subscription_id
tenant_id       = var.tenant_id
features {}
}


provider "azurerm" {
alias           = "hub_sub"
subscription_id = var.subscription_id_hub
tenant_id       = var.tenant_id_hub
features {}
}



data "terraform_remote_state" "hub" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_transit_hub_network.tfstate"
  }
}


data "terraform_remote_state" "prd" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_transit_prd_base.tfstate"
  }
}