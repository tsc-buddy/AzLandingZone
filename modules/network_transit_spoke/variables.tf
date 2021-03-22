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

##route table

variable "disable_bgp_route_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
  default     = null
}

variable "address_prefix" {
  description = "(Required) The destination CIDR to which the route applies, such as 10.1.0.0/16"
  type        = string
}

variable "next_hop_type" {
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None"
  type        = string
}

variable "next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
  default     = null
}




variable "address_prefix_app01" {
  description = "The address prefixe to use for the app01 subnet."
  type        = list
}
variable "address_prefix_app02" {
  description = "The address prefixe to use for the app02 subnet."
  type        = list
}
