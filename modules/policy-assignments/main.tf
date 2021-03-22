resource "azurerm_policy_assignment" "tag_governance" {
  name                 = "tag_governance"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = var.tag_governance_policyset_id
  description          = "Assignment of the Tag Governance initiative to subscription."
  display_name         = "Tag Governance"
  location             = var.location
  identity { type = "SystemAssigned" }
}

resource "azurerm_policy_assignment" "iam_governance" {
  name                 = "iam_governance"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = var.iam_governance_policyset_id
  description          = "Assignment of the IAM Governance initiative to subscription."
  display_name         = "Identity and Access Management Governance"
}

resource "azurerm_policy_assignment" "security_governance" {
  name                 = "security_governance"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = var.security_governance_policyset_id
  description          = "Assignment of the Security Governance initiative to subscription."
  display_name         = "Security Governance"
  location             = var.location
  identity { type = "SystemAssigned" }
}

resource "azurerm_policy_assignment" "data_protection_governance" {
  name                 = "data_protection_governance"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = var.data_protection_governance_policyset_id
  description          = "Assignment of the Data Protection Governance initiative to subscription."
  display_name         = "Data Protection Governance"
}

resource "azurerm_policy_assignment" "compute_governance" {
  name                 = "compute_governance"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = var.compute_governance_policyset_id
  description          = "Assignment of the Compute Governance initiative to subscription."
  display_name         = "Compute Governance"
  location             = var.location

   parameters = jsonencode({
    "allowedLocations": {
      "value": var.allowedlocations,
    },
    "listOfAllowedVMSKUs": {
      "value": var.listOfAllowedVMSKUs,
    },
  })
} 

resource "azurerm_policy_assignment" "security_governance_built_in" {
  name                 = "security_governance_built_in"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
  description          = "Assignment of the built in Azure Security Center initiative to subscription."
  display_name         = "Azure Security Center"
  location             = var.location
  identity { type = "SystemAssigned" }
}




resource "azurerm_policy_assignment" "monitoring_governance_built_in" {
  name                 = "monitoring_governance_built_in"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/55f3eceb-5573-4f18-9695-226972c6d74a"
  description          = "Enable Azure Monitor for the virtual machines (VMs) in the specified scope (management group, subscription or resource group)."
  display_name         = "Azure Monitor"
  location             = var.location
  parameters = jsonencode({
    logAnalytics_1 = {
      value = var.la_workspace_id,

    }
  })

identity { type = "SystemAssigned" }
}

resource "azurerm_role_assignment" "assignment" {
 scope                = azurerm_policy_assignment.monitoring_governance_built_in.scope
  role_definition_name = "Contributor"
  principal_id         = azurerm_policy_assignment.monitoring_governance_built_in.identity[0].principal_id
}



