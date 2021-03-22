terraform {
  required_version = "~> 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.32.0"
    }
  }
}

provider "azurerm" {
subscription_id = var.subscription_id
tenant_id       = var.tenant_id
features {}
}


### Remote States ###

terraform {
  required_version = "~> 0.13.0"
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_transit_prd_base.tfstate"
  }
}


data "terraform_remote_state" "hub" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_transit_hub_base.tfstate"
  }
}





