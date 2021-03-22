###
# Environment composition
###

###
# Virtual Network
###

module "network_hub" {
  source              = "../../../../modules/network_hub"
  environment         = var.environment
  location              = var.location
  location_short        = var.location_short
  address_space       = var.address_space
  address_prefix_app01 = var.address_prefix_app01
  address_prefix_app02 = var.address_prefix_app02
  dns_servers         = concat(var.private_ip_address_adds, ["168.63.129.16"])
  tags                = var.tags
}


resource "azurerm_monitor_diagnostic_setting" "vnet_diag" {
  name                          = "vnet_diag"
  target_resource_id            = module.network_hub.virtual_network_id
  log_analytics_workspace_id    = data.terraform_remote_state.hub_base.outputs.la_workspace_id
  depends_on                   = [module.network_hub]
  
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
  target_resource_id            = module.network_hub.nsg_app01_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_hub]
  
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
  target_resource_id            = module.network_hub.nsg_app02_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_hub]
  
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


#   #virtual gateway

# module "public_ip_vgw" {
#   source            = "../../resources/network/public_ip"
#   resource_group    = module.resource_group.name
#   location          = module.resource_group.location
#   environment       = var.environment
#   location_short    = var.location_short
#   name_prefix       = "pip-vgw"
#   allocation_method = "Dynamic"
#   sku               = "Basic"
#   tags              = var.tags
# }

# module "virtual_network_gateway" {
#   source                = "../../resources/network/virtual_network_gateway"
#   resource_group        = module.resource_group.name
#   location              = module.resource_group.location
#   location_short        = var.location_short
#   environment           = var.environment
#   virtual_network_name  = module.virtual_network.name
#   public_ip_name        = module.public_ip_vgw.name
#   public_ip_address_id  = module.public_ip_vgw.id
#   address_prefixes      = var.address_prefix_vgw
#   type                  = var.vgw_type
#   sku                   = var.vgw_sku
#   #vpn_client_protocols  = var.vpn_client_protocols
#   address_space         = var.vpn_address_space
#   #root_certificate_name = "P2SRootCert"
#   #public_cert_data      = file("${path.module}/rootcertificate.cer")
#   tags                  = var.tags
# }

   
