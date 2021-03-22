###
#  module variables
###

#common

variable "location" {
  description = "Geographic location resource will be deployed into"
  type        = string
}
variable "location_short" {
  description = "Short name of location"
}


variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

