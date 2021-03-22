###
# resource variables
###

#common

variable "resource_group" {
  description = "This is the resource group to which the resources will be deployed"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "nsg"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}

variable "location_short" {
  description = "Short name of location"
}


#nsg

variable "policy_name" {
  description = "policy name or app name"
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}