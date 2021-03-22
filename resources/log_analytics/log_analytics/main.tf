###
# resource composition
###

#random string

resource "random_string" "base" {
  length  = 6
  special = false
}

#log analytics workspace

resource "azurerm_log_analytics_workspace" "base" {
  name                = lower("la-${var.environment}${random_string.base.result}-${var.location_short}")
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "Updates" {
  solution_name         = "Updates"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }
}


resource "azurerm_log_analytics_solution" "AgentHealthAssessment" {
  solution_name         = "AgentHealthAssessment"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }
}


resource "azurerm_log_analytics_solution" "ChangeTracking" {
  solution_name         = "ChangeTracking"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_solution" "AzureActivity" {
  solution_name         = "AzureActivity"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }
}

resource "azurerm_log_analytics_solution" "VMInsights" {
  solution_name         = "VMInsights"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/VMInsights"
  }
}

resource "azurerm_log_analytics_solution" "AntiMalware" {
  solution_name         = "AntiMalware"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }
}
resource "azurerm_log_analytics_solution" "ServiceMap" {
  solution_name         = "ServiceMap"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "SQLAssessmentPlus" {
  solution_name         = "SQLAssessmentPlus"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SQLAssessmentPlus"
  }
}


resource "azurerm_log_analytics_solution" "KeyVaultAnalytics" {
  solution_name         = "KeyVaultAnalytics"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "InfrastructureInsights" {
  solution_name         = "InfrastructureInsights"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/InfrastructureInsights"
  }
}


resource "azurerm_log_analytics_solution" "SecurityInsights" {
  solution_name         = "SecurityInsights"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}

resource "azurerm_log_analytics_solution" "WindowsFirewall" {
  solution_name         = "WindowsFirewall"
  location              = var.location
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.base.id
  workspace_name        = azurerm_log_analytics_workspace.base.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/WindowsFirewall"
  }
}