###
# Environment composition
###

###
# Compute
###

module "domain_controllers" {
  source                         = "../../../../modules/domain_controllers_transit"
  environment                    = var.environment
  location                       = var.location
  location_short                 = var.location_short
  virtual_network_resource_group = data.terraform_remote_state.hub_network.outputs.network_hub_resource_group_name
  virtual_network_name           = data.terraform_remote_state.hub_network.outputs.network_hub_name
  address_prefix_adds            = var.address_prefix_adds
  storage_account_uri            = data.terraform_remote_state.hub_base.outputs.boot_diagnostic_storage_endpoint
  private_ip_address_adds        = var.private_ip_address_adds
  tags                           = var.tags
   
}

module "route_table_association_adds" {
  source                        = "../../../../resources/network/subnet_route_table_association"
  subnet_id                     = element(module.domain_controllers.subnet_id ,0)
  route_table_id                = data.terraform_remote_state.hub_network.outputs.route_table_id
  depends_on                    = [module.domain_controllers]
   }



# module "windows_jumpbox" {
#   source                         = "../../../../modules/windows_jumpbox_transit"
#   environment                    = var.environment
#   location                         = var.location
#   location_short           = var.location_short
#   virtual_network_resource_group = data.terraform_remote_state.hub_network.outputs.network_hub_resource_group_name
#   virtual_network_name           = data.terraform_remote_state.hub_network.outputs.network_hub_name
#   address_prefix_jumpbox         = var.address_prefix_jumpbox
#   storage_account_uri            = data.terraform_remote_state.hub_base.outputs.boot_diagnostic_storage_endpoint
#   tags                           = var.tags
# }

# module "route_table_association_jumpbox" {
#   source                    = "../../../../resources/network/subnet_route_table_association"
#   subnet_id                 = element(module.windows_jumpbox.subnet_id ,3)
#   route_table_id            = data.terraform_remote_state.hub_network.outputs.route_table_id
#   depends_on                = [module.windows_jumpbox]
#    }

module "bastion" {
  source                         = "../../../../modules/bastion"
  environment                    = var.environment
  location                       = var.location
  location_short                 = var.location_short
  virtual_network_resource_group = data.terraform_remote_state.hub_network.outputs.network_hub_resource_group_name
  virtual_network_name           = data.terraform_remote_state.hub_network.outputs.network_hub_name
  address_prefix_bastion         = var.address_prefix_bastion
  tags                           = var.tags
}


  resource "azurerm_monitor_diagnostic_setting" "nsg_adds_diag" {
  name                          = "nsg_diag"
  target_resource_id            = module.domain_controllers.nsg_id
  log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  depends_on                   = [module.domain_controllers]
  
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

  resource "azurerm_monitor_diagnostic_setting" "nic_adds_diag" {
  name                          = "nic_diag"
  target_resource_id            = module.domain_controllers.network_interface_id
  log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  depends_on                   = [module.domain_controllers]
  
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
      days = 60
    }
  }

  }

  # resource "azurerm_monitor_diagnostic_setting" "nsg_jumpbox_diag" {
  # name                         = "nsg_diag"
  # target_resource_id           = module.windows_jumpbox.nsg_id
  # log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  # depends_on                   = [module.windows_jumpbox]
  
  # log {
  #   category = "NetworkSecurityGroupEvent"
  #   enabled  = true


  #   retention_policy {
  #     enabled = true
  #     days = 60
  #   }
  
  # }

  #   log {
  #   category = "NetworkSecurityGroupRuleCounter"
  #   enabled  = true


  #   retention_policy {
  #     enabled = true
  #     days = 60
  #   }
  
  # }

  # }

  # resource "azurerm_monitor_diagnostic_setting" "nic_jumpbox_diag" {
  # name                         = "nic_diag"
  # target_resource_id           = module.windows_jumpbox.network_interface_id
  # log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  # depends_on                   = [module.windows_jumpbox]
  
  # metric {
  #   category = "AllMetrics"

  #   retention_policy {
  #     enabled = false
  #     days = 60
  #   }
  # }

  # }


  resource "azurerm_monitor_diagnostic_setting" "bastion_pip_diag" {
  name                          = "pip_diag"
  target_resource_id            = module.bastion.bastion_pip_id
  log_analytics_workspace_id    = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  depends_on                    = [module.bastion]
  
  log {
    category = "DDoSProtectionNotifications"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "DDoSMitigationFlowLogs"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "DDoSMitigationReports"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

  }


resource "azurerm_monitor_diagnostic_setting" "bastion_diag" {
  name                          = "bastion_diag"
  target_resource_id            = module.bastion.bastion_id
  log_analytics_workspace_id    = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  depends_on                    = [module.bastion]
  
  log {
    category = "BastionAuditLogs"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

}

