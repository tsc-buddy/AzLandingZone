data "azurerm_subscription" "current" {
}

variable "tag_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for tag_governance"
}

variable "iam_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for iam_governance"
}

variable "security_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for security_governance"
}

variable "data_protection_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for data_protection_governance"
}

variable "compute_governance_policyset_id" {
  type        = string
  description = "The policy set definition id for compute_governance"
}

variable "la_workspace_id" {
  type        = string
  description = "The id of the Log Analytics Workspace"
  default = "module.audit_logs.la_workspace_id_json"
}

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}

variable "allowedlocations" {
  type = list
}

variable "listOfAllowedVMSKUs" {
  type = list
}

# variable "environment" {
#   type = string
# }

