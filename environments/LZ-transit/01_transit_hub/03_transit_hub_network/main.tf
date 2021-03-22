###
# Environment composition
###

###
# Virtual Network
###

module "network_transit_hub" {
  source              = "../../../../modules/network_transit_hub"
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short
  address_space       = var.address_space
  address_prefix_vgw  = var.address_prefix_vgw
  address_prefix_fw   = var.address_prefix_fw
  address_prefix_app01 = var.address_prefix_app01
  address_prefix_app02 = var.address_prefix_app02
  address_prefix_adds  = var.address_prefix_adds
  #next_hop_in_ip_address                  =    var.next_hop_in_ip_address
  address_prefix         = var.address_prefix
  next_hop_type          = var.next_hop_type
  dns_servers         = concat(var.private_ip_address_adds, ["168.63.129.16"])
  tags                = var.tags
}

###
# Diagnostic Settings
###

resource "azurerm_monitor_diagnostic_setting" "vnet_diag" {
  name                          = "vnet_diag"
  target_resource_id            = module.network_transit_hub.virtual_network_id
  log_analytics_workspace_id    = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
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


resource "azurerm_monitor_diagnostic_setting" "fw_diag" {
  name                          = "fw_diag"
  target_resource_id            = module.network_transit_hub.firewall_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub.firewall_id]
  
  log {
    category = "AzureFirewallApplicationRule"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "AzureFirewallNetworkRule"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "AzureFirewallDnsProxy"
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


resource "azurerm_monitor_diagnostic_setting" "vgw_diag" {
  name                          = "vgw_diag"
  target_resource_id            = module.network_transit_hub.vgw_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
  log {
    category = "GatewayDiagnosticLog"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "TunnelDiagnosticLog"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

    log {
    category = "RouteDiagnosticLog"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "IKEDiagnosticLog"
    enabled  = true


    retention_policy {
      enabled = true
      days = 60
    }
  
  }

      log {
    category = "P2SDiagnosticLog"
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
  target_resource_id            = module.network_transit_hub.nsg_app01_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
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
  target_resource_id            = module.network_transit_hub.nsg_app02_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
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

    resource "azurerm_monitor_diagnostic_setting" "fw_pip_diag" {
  name                          = "pip_diag"
  target_resource_id            = module.network_transit_hub.fw_pip_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
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

  resource "azurerm_monitor_diagnostic_setting" "vgw_pip_diag" {
  name                          = "pip_diag"
  target_resource_id            = module.network_transit_hub.vgw_pip_id
   log_analytics_workspace_id   = data.terraform_remote_state.hub_base.outputs.la_workspace_id
   depends_on                   = [module.network_transit_hub]
  
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



###
# Firewall Rules
###

resource "azurerm_firewall_network_rule_collection" "Active_Directory" {
  name                = "Active_Directory"
  azure_firewall_name = module.network_transit_hub.firewall_name
  resource_group_name = module.network_transit_hub.virtual_network_resource_group_name
  priority            = 100
  action              = "Allow"

  rule {
    name = "LDAP"
    source_addresses = ["*"]
    destination_ports = ["389"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
    rule {
    name = "LDAP SSL"
    source_addresses = ["*"]
    destination_ports = ["636"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "LDAP GC"
    source_addresses = ["*"]
    destination_ports = ["3268"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "LDAP GC SSL"
    source_addresses = ["*"]
    destination_ports = ["3269"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "Kerberos"
    source_addresses = ["*"]
    destination_ports = ["88"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "DNS"
    source_addresses = ["*"]
    destination_ports = ["53"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc"
    source_addresses = ["*"]
    destination_ports = ["445"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "SMTP"
    source_addresses = ["*"]
    destination_ports = ["25"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "RPC, EPM"
    source_addresses = ["*"]
    destination_ports = ["135"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS"
    source_addresses = ["*"]
    destination_ports = ["49152-65535"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "RPC, DFSR (SYSVOL)"
    source_addresses = ["*"]
    destination_ports = ["5722"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "Windows Time"
    source_addresses = ["*"]
    destination_ports = ["123"]
    destination_addresses = var.address_prefix_adds
    protocols = ["UDP"]
  }
      rule {
    name = "Kerberos change and set password"
    source_addresses = ["*"]
    destination_ports = ["464"]
    destination_addresses = var.address_prefix_adds
    protocols = ["Any"]
  }
      rule {
    name = "DCOM, RPC, EPM"
    source_addresses = ["*"]
    destination_ports = ["49152-65535"]
    destination_addresses = var.address_prefix_adds
    protocols = ["UDP"]
  }
      rule {
    name = "DFSN, NetLogon, NetBIOS Datagram Service"
    source_addresses = ["*"]
    destination_ports = ["138"]
    destination_addresses = var.address_prefix_adds
    protocols = ["UDP"]
  }
      rule {
    name = "SOAP"
    source_addresses = ["*"]
    destination_ports = ["9389"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }
      rule {
    name = "NetLogon, NetBIOS Name Resolution"
    source_addresses = ["*"]
    destination_ports = ["137"]
    destination_addresses = var.address_prefix_adds
    protocols = ["UDP"]
  }
      rule {
    name = "DFSN, NetBIOS Session Service, NetLogon"
    source_addresses = ["*"]
    destination_ports = ["139"]
    destination_addresses = var.address_prefix_adds
    protocols = ["TCP"]
  }

}

 resource "azurerm_firewall_network_rule_collection" "Outbound_Internet" {
  name                = "Outbound_Internet"
  azure_firewall_name = module.network_transit_hub.firewall_name
  resource_group_name = module.network_transit_hub.virtual_network_resource_group_name
  priority            = 101
  action              = "Allow"

  rule {
    name = "HTTP/HTTPS"
    source_addresses = var.address_prefixes_all_fw_rules
    destination_ports = ["80","443"]
    destination_addresses = ["*"]
    protocols = ["Any"]
  }

 }

###
# Firewall Rules
###


resource "azurerm_firewall_network_rule_collection" "RDP_and_SSH_Connectivity_Between_Hub_and_Spokes" {
  name                = "RDP_and_SSH_Connectivity_Between_Hub_and_Spokes"
  azure_firewall_name = module.network_transit_hub.firewall_name
  resource_group_name = module.network_transit_hub.virtual_network_resource_group_name
  priority            = 102
  action              = "Allow"

  rule {
    name = "Allow RDP and SSH"
    source_addresses = var.address_prefixes_all_fw_rules
    destination_ports = ["3389","22"]
    destination_addresses = var.address_prefixes_all_fw_rules
    protocols = ["Any"]
  }
}


