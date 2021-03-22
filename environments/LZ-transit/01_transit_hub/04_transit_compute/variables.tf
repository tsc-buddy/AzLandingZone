###
# Environment variables
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
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

variable "location" {
  description = "Geographic location resource will be deployed into"
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

variable "address_prefix_vgw" {
  description = "The address prefix to use for the vgw subnet."
  #type        = list
}

variable "address_prefix_fw" {
  description = "The address prefixe to use for the fw subnet."
  #type        = list
}

variable "address_prefix_jumpbox" {
  description = "The address prefixe to use for the jumpbox subnet."
  #type        = list
}

variable "address_prefix_bastion" {
  description = "The address prefixe to use for the bastion subnet."
  #type        = list
}

variable "address_prefix_adds" {
  description = "The address prefixe to use for the aads subnet."
  type        = list
}


variable "private_ip_address_adds" {
  description = "(Required) The Static IP address for the aads Servers"
  type        = list
}

variable "address_prefix_app01" {
  description = "The address prefixe to use for the aads subnet."
  type        = list
}

variable "address_prefix_app02" {
  description = "The address prefixe to use for the aads subnet."
  type        = list
}

variable "address_prefixes_hub_fw_rules" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
}

variable "address_prefixes_spokes_fw_rules" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
}

variable "address_prefixes_all_fw_rules" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
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











