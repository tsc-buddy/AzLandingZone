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


#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

# Module Deployment Settings

variable domain_controller_settings {}
variable windows_jumpbox_settings {}
variable bastion_settings {}








