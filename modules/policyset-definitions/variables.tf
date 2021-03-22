variable "policyset_definition_category" {
  type        = string
  description = "The category to use for all PolicySet defintions"
  default     = "Custom"
}

variable "custom_policies_tag_governance" {
  type = list(map(string))
}

variable "custom_policies_iam_governance" {
  type = list(map(string))
}

variable "builtin_policies_iam_governance" {
  type        = list
  description = "List of built-in policy definitions (display names) for the iam_governance policyset"
  default = [
    "Audit usage of custom RBAC rules",
    "Custom subscription owner roles should not exist",
    "Deprecated accounts should be removed from your subscription",
    "Deprecated accounts with owner permissions should be removed from your subscription",
    "External accounts with write permissions should be removed from your subscription",
    "External accounts with read permissions should be removed from your subscription",
    "External accounts with owner permissions should be removed from your subscription",
    "MFA should be enabled accounts with write permissions on your subscription",
    "MFA should be enabled on accounts with owner permissions on your subscription",
    "MFA should be enabled on accounts with read permissions on your subscription",
    "There should be more than one owner assigned to your subscription"
  ]
}

variable "builtin_policies_security_governance" {
  type        = list
  description = "List of policy definitions (display names) for the security_governance policyset"
  default = [
    "Internet-facing virtual machines should be protected with network security groups",
    "Subnets should be associated with a Network Security Group",
    "Gateway subnets should not be configured with a network security group",
    "Storage accounts should restrict network access",
    "Secure transfer to storage accounts should be enabled",
    "Storage accounts should allow access from trusted Microsoft services",
    "RDP access from the Internet should be blocked",
    "SSH access from the Internet should be blocked",
    "Disk encryption should be applied on virtual machines",
    "Automation account variables should be encrypted",
    "Azure subscriptions should have a log profile for Activity Log",
    "Email notification to subscription owner for high severity alerts should be enabled",
    "Subscriptions should have a contact email address for security issues",
    "Enable Azure Security Center on your subscription"
  ]
}

variable "builtin_policies_data_protection_governance" {
  type        = list
  description = "List of policy definitions (display names) for the data_protection_governance policyset"
  default = [
    "Azure Backup should be enabled for Virtual Machines",
    "Long-term geo-redundant backup should be enabled for Azure SQL Databases",
    "Audit virtual machines without disaster recovery configured"
     ]
}

variable "compute_policyset_definitions" {
  type        = list
  description = "List of policy definitions (display names) for the compute_governance policyset"
  default = [
    "Allowed locations for resource groups",
    "Allowed virtual machine size SKUs"
     ]

}


data "azurerm_policy_definition" "builtin_policies_iam_governance" {
  count        = length(var.builtin_policies_iam_governance)
  display_name = var.builtin_policies_iam_governance[count.index]
}

data "azurerm_policy_definition" "builtin_policies_security_governance" {
  count        = length(var.builtin_policies_security_governance)
  display_name = var.builtin_policies_security_governance[count.index]
}

data "azurerm_policy_definition" "builtin_policies_data_protection_governance" {
  count        = length(var.builtin_policies_data_protection_governance)
  display_name = var.builtin_policies_data_protection_governance[count.index]
}

data "azurerm_policy_definition" "compute_policyset_definitions" {
  count        = length(var.compute_policyset_definitions)
  display_name = var.compute_policyset_definitions[count.index]
}

