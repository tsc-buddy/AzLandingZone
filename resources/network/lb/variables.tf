###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "lb"
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


#lb

variable "sku" {
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet which should be associated with the IP Configuration."
  type        = string
  default     = null
}

variable "private_ip_address" {
  description = "(Optional) Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned."
  type        = string
  default     = null
}

variable "private_ip_address_allocation" {
  description = "(Optional) The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static."
  type        = string
  default     = null
}

variable "private_ip_address_version" {
  description = "The version of IP that the Private IP Address is. Possible values are IPv4 or IPv6."
  type        = string
  default     = "IPv4"
}

variable "public_ip_address_id" {
  description = "(Optional) The ID of a Public IP Address which should be associated with the Load Balancer."
  type        = string
  default     = null
}

variable "public_ip_prefix_id" {
  description = "(Optional) The ID of a Public IP Prefix which should be associated with the Load Balancer. Public IP Prefix can only be used with outbound rules."
  type        = string
  default     = null
}

variable "zones" {
  description = "(Optional) A list of Availability Zones which the Load Balancer's IP Addresses should be created in."
  type        = list
  default     = null
}

variable "frontend_ip_configuration" {
  description = "(Optional) One or multiple frontend_ip_configuration blocks as documented below."
  type        = list
  default     = []
  /*
  frontend_ip_configuration supports the following:
  name - (Required) Specifies the name of the frontend ip configuration.
  subnet_id - The ID of the Subnet which should be associated with the IP Configuration.
  private_ip_address - (Optional) Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned.
  private_ip_address_allocation - (Optional) The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static.
  private_ip_address_version - The version of IP that the Private IP Address is. Possible values are IPv4 or IPv6.
  public_ip_address_id - (Optional) The ID of a Public IP Address which should be associated with the Load Balancer.
  public_ip_prefix_id - (Optional) The ID of a Public IP Prefix which should be associated with the Load Balancer. Public IP Prefix can only be used with outbound rules.
  zones - (Optional) A list of Availability Zones which the Load Balancer's IP Addresses should be created in.
  */
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

