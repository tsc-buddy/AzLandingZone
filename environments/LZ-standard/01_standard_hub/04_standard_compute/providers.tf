###
# Environment providers
###

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

provider "azurerm" {
alias           = "hub_sub"
subscription_id = var.subscription_id_hub
tenant_id       = var.tenant_id_hub
features {}
}


### Remote States ###

terraform {
  required_version = "~> 0.13.0"
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_standard_hub_compute.tfstate"
  }
}

###
# Retrieve data from remote state
###

data "terraform_remote_state" "hub_network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_standard_hub_network.tfstate"
  }
}

data "terraform_remote_state" "hub_base" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraformstate-ae"
    storage_account_name = "lzstatetf"
    container_name       = "tfstate"
    key                  = "lz_standard_hub_base.tfstate"
  }
}

