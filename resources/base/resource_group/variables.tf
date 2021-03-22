###
# resource variables
###

#resource-group

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "rg"
}

variable "service_name" {
  description = "Name of the application, service, or workload the resource group is housing."
  type        = string
}

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


#tags

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  type        = map
  default     = {}
}