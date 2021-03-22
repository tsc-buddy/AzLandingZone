###
#  module variables
###

#common

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}


variable "location_short" {
  description = "Short name of location"
}

#key vault

variable "sku_name" {
  description = "The Name of the sku used for this Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"
}

#key vault policy

variable "object_id" {
  description = "The object ID for the Service Principal"
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
