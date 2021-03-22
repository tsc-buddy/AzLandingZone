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


#vnet

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}



#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


variable "address_prefix_app01" {
  description = "The address prefixe to use for the app01 subnet."
  type        = list
}
variable "address_prefix_app02" {
  description = "The address prefixe to use for the app02 subnet."
  type        = list
}
