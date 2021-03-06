###
# Environment variables
###

#common

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}

variable "subscription_id" {
  description = "id of subscription for workload deployment"
  type        = string
}

variable "tenant_id" {
  description = "id of tenant for workload deployment"
  type        = string
}

variable "subscription_id_hub" {
  description = "id of subscription for workload deployment"
  type        = string
}

variable "tenant_id_hub" {
  description = "id of tenant for workload deployment"
  type        = string
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

variable "object_id" {
  description = "The object ID for the Service Principal"
  type        = string
}

variable "location_short" {
  description = "Short name of location"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#recovery services vault

variable "sku" {
  description = "(Required) Sets the vault's SKU. Possible values include: Standard, RS0."
  type        = string
}

variable "soft_delete_enabled" {
  description = "(Optional) Is soft delete enable for this Vault? Defaults to true."
  type        = bool
  default     = null
}

variable "allowedlocations" {
  type = list
}

variable "listOfAllowedVMSKUs" {
  type = list
}







