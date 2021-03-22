###
# Environment variables
###


terraform {
  required_version = "~> 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.31.0"
    }
  }
}

provider "azurerm" {
subscription_id = var.subscription_id
tenant_id       = var.tenant_id
features {}
}






