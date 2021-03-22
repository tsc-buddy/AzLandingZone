###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "route"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "location_short" {
  description = "Short name of location"
}

##route table

variable "disable_bgp_route_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
  default     = null
}

variable "next_hop_in_ip_address" {
  description = "The route table default route next hop."
  #type        = list
}



#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}



