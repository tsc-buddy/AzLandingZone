###
# Environment composition
###


module "network_spoke" {
  source                                  = "../../../../modules/network_spoke"
  environment                             = var.environment
  location                                  = var.location
  location_short                          = var.location_short
  address_space                           = var.address_space
  address_prefix_app01                    = var.address_prefix_app01
  address_prefix_app02                    = var.address_prefix_app02
  tags                                    = var.tags
}


###
# Peerings
###

resource "azurerm_virtual_network_peering" "dev-to-hub" {
   name                      = "${module.network_spoke.virtual_network_name}-to-${data.terraform_remote_state.hub.outputs.network_hub_name}"
  resource_group_name       = module.network_spoke.virtual_network_resource_group_name
  virtual_network_name      = module.network_spoke.virtual_network_name
  remote_virtual_network_id = data.terraform_remote_state.hub.outputs.network_hub_id
  depends_on                = [module.network_spoke.resource_group_name]
  }

resource "azurerm_virtual_network_peering" "hub-to-dev" {
  provider                  = azurerm.hub_sub
  name                      = "${data.terraform_remote_state.hub.outputs.network_hub_name}-to-${module.network_spoke.virtual_network_name}"
  resource_group_name       = data.terraform_remote_state.hub.outputs.network_hub_resource_group_name
  virtual_network_name      = data.terraform_remote_state.hub.outputs.network_hub_name
  remote_virtual_network_id = module.network_spoke.virtual_network_id
  allow_forwarded_traffic   = true
}



resource "azurerm_monitor_diagnostic_setting" "vnet_diag" {
  name                          = "vnet_diag"
  target_resource_id            = module.network_spoke.virtual_network_id
  log_analytics_workspace_id    = data.terraform_remote_state.dev.outputs.la_workspace_id
  depends_on                   = [module.network_spoke]
  
  log {
    category = "VMProtectionAlerts"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
      days = 60
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "nsg_app01_diag" {
  name                          = "nsg_diag"
  target_resource_id            = module.network_spoke.nsg_app01_id
   log_analytics_workspace_id   = data.terraform_remote_state.dev.outputs.la_workspace_id
   depends_on                   = [module.network_spoke]
  
  log {
    category = "NetworkSecurityGroupEvent"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "NetworkSecurityGroupRuleCounter"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

  }

  resource "azurerm_monitor_diagnostic_setting" "nsg_app02_diag" {
  name                          = "nsg_diag"
  target_resource_id            = module.network_spoke.nsg_app02_id
   log_analytics_workspace_id   = data.terraform_remote_state.dev.outputs.la_workspace_id
   depends_on                   = [module.network_spoke]
  
  log {
    category = "NetworkSecurityGroupEvent"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "NetworkSecurityGroupRuleCounter"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

  }