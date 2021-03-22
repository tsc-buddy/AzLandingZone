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


#virtual network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  type        = list
  default     = null
}

variable "address_prefix_vgw" {
  description = "The address prefixe to use for the vgw subnet."
  type        = list
}

variable "address_prefix_fw" {
  description = "The address prefixe to use for the fw subnet."
  type        = list
}

variable "address_prefix_app01" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
}

variable "address_prefix_app02" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
}

variable "address_prefix_adds" {
  description = "The address prefixe to use for the aads subnet."
  #type        = list
}

#virtual network gateway

variable "vgw_sku" {
  description = "(Optional) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
  type        = string
  default     = "Basic"
}

variable "vgw_type" {
  description = "(Optional) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
  type        = string
  default     = "Vpn"
}

variable "vpn_client_protocols" {
  description = "(Optional) List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
  default     = ["SSTP"]
}

variable "vpn_address_space" {
  description = "(Required) The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation."
  type        = list
  default     = ["192.168.100.0/24"]
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







