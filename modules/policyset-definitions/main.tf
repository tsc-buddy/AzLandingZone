resource "azurerm_policy_set_definition" "tag_governance" {

  name         = "tag_governance"
  policy_type  = "Custom"
  display_name = "Tag Governance"
  description  = "Contains common Tag Governance policies"

  metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }

METADATA

  dynamic "policy_definition_reference" {
    for_each = var.custom_policies_tag_governance
    content {
      policy_definition_id = policy_definition_reference.value["policyID"]
      reference_id         = policy_definition_reference.value["policyID"]
    }
  }
}

resource "azurerm_policy_set_definition" "iam_governance" {

  name         = "iam_governance"
  policy_type  = "Custom"
  display_name = "Identity and Access Management Governance"
  description  = "Contains common Identity and Access Management Governance policies"

  metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }

METADATA

  dynamic "policy_definition_reference" {
    for_each = var.custom_policies_iam_governance
    content {
      policy_definition_id = policy_definition_reference.value["policyID"]
      reference_id         = policy_definition_reference.value["policyID"]
    }
  }

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.builtin_policies_iam_governance
    content {
      policy_definition_id = policy_definition_reference.value["id"]
      reference_id         = policy_definition_reference.value["id"]
    }
  }
}

resource "azurerm_policy_set_definition" "security_governance" {

  name         = "security_governance"
  policy_type  = "Custom"
  display_name = "Security Governance"
  description  = "Contains common Security Governance policies"

  metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }

METADATA

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.builtin_policies_security_governance
    content {
      policy_definition_id = policy_definition_reference.value["id"]
      reference_id         = policy_definition_reference.value["id"]
    }
  }
}

resource "azurerm_policy_set_definition" "data_protection_governance" {

  name         = "data_protection_governance"
  policy_type  = "Custom"
  display_name = "Data Protection Governance"
  description  = "Contains common Data Protection Governance policies"

  metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }

METADATA

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.builtin_policies_data_protection_governance
    content {
      policy_definition_id = policy_definition_reference.value["id"]
      reference_id         = policy_definition_reference.value["id"]
    }
  }
}


resource "azurerm_policy_set_definition" "compute_governance" {
  name         = "Compute Governance"
  policy_type  = "Custom"
  display_name = "Compute Governance"
  description  = "Contains common Compute Governance policies"

    metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }
    METADATA

  parameters = <<PARAMETERS
    {
        "allowedLocations": {
            "type": "Array",
            "metadata": {
                "description": "The list of locations that resource groups can be created in.",
                "displayName": "Allowed locations",
                "strongType": "location"
            },
            "defaultValue": ["australiaeast","australiasoutheast"
                                ]
        },
        "listOfAllowedVMSKUs": {
            "type": "Array",
            "metadata": {
              "description": "The list of size SKUs that can be specified for virtual machines.",
              "displayName": "Allowed VM Size SKUs",
              "strongType": "VMSKUs"
            },
            "defaultValue": [
                "standard_b2s",
                "standard_b1s",
                "standard_d2",
                "standard_d2_v2"
                ]
        }
    }
PARAMETERS

  policy_definition_reference {
    policy_definition_id = data.azurerm_policy_definition.compute_policyset_definitions.*.id[0]
    parameter_values     = <<VALUE
    {
      "listOfAllowedLocations": {"value": "[parameters('allowedLocations')]"}
    }
    VALUE
  }

  policy_definition_reference {
    policy_definition_id = data.azurerm_policy_definition.compute_policyset_definitions.*.id[1]
    parameter_values     = <<VALUE
    {
      "listOfAllowedSKUs": {"value": "[parameters('listOfAllowedVMSKUs')]"}
    }
    VALUE
  }



}
