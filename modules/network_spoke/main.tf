###
#  module composition
###


#  resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "network"
  location       = var.location
  location_short  = var.location_short
  environment  = var.environment
  tags         = var.tags
}

#virtual network

module "virtual_network" {
  source         = "../../resources/network/virtual_network"
  resource_group = module.resource_group.name
  location         = module.resource_group.location
  environment    = var.environment
  location_short       = var.location_short
  name_prefix    = "vnet"
  address_space  = var.address_space
  tags           = var.tags
}


module "app01-subnet" {
  source                        = "../../resources/network/subnet"
  resource_group                = module.resource_group.name
  location                        = var.location
  location_short                = var.location_short
  virtual_network_name          = module.virtual_network.name
  name_prefixes                 = ["snet-app01"]
  address_prefixes              = var.address_prefix_app01
  environment                   = var.environment
}

module "app02-subnet" {
  source                        = "../../resources/network/subnet"
  resource_group                = module.resource_group.name
  location                        = var.location
  location_short                = var.location_short
  virtual_network_name          = module.virtual_network.name
  name_prefixes                 = ["snet-app02"]
  address_prefixes              = var.address_prefix_app02
  environment                   = var.environment
}
##
# Network Security Group
##

module "network_security_group_app01" {
  source         = "../../resources/network/network_security_group"
    resource_group = module.resource_group.name
  environment    = var.environment
  location         = var.location
   location_short              = var.location_short
  policy_name    = "app01"
  tags           = var.tags
}

module "network_security_group_app02" {
  source         = "../../resources/network/network_security_group"
   resource_group = module.resource_group.name
  environment    = var.environment
  location         = var.location
   location_short              = var.location_short
  policy_name    = "app02"
  tags           = var.tags
}

##
# Network Security Group Associations
##

module "subnet_network_security_group_association_app01" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.app01-subnet.id, 2)
  network_security_group_id = module.network_security_group_app01.id
}

module "subnet_network_security_group_association_app02" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.app02-subnet.id, 3)
  network_security_group_id = module.network_security_group_app02.id
}





