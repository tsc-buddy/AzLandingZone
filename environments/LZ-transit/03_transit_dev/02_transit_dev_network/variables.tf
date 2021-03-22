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

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "location_short" {
  description = "Short name of location"
}

#authentication

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "object_id" {
  description = "The object ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}

#network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

# variable "address_prefix_agw" {
#   description = "The address prefixe to use for the agw subnet."
#   type        = list(string)
# }



# variable "address_prefix_bastion" {
#   description = "The address prefixe to use for the bastion subnet."
#   type        = list
# }

variable "name_prefixes" {
  description = "This is a list of the ip address prefixes for the vnet"
  type        = list
}
# variable "address_prefixes" {
#   description = "This is a list of the ip address prefixes for the vnet"
#   type        = list
# }
variable "address_prefix_app01" {
  description = "The address prefixe to use for the app01 subnet."
  type        = list
}
variable "address_prefix_app02" {
  description = "The address prefixe to use for the app02 subnet."
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


variable "next_hop_in_ip_address" {
  description = "The route table default route next hop."
  #type        = list
}


variable "address_prefix" {
  description = "(Required) The destination CIDR to which the route applies, such as 10.1.0.0/16"
  type        = string
}


variable "next_hop_type" {
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None"
  type        = string
}

