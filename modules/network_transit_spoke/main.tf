###
#  module composition
###


#  resource group

module "resource_group" {
  source                        = "../../resources/base/resource_group"
  service_name                  = "network"
  location                      = var.location
  location_short                = var.location_short
  environment                   = var.environment
  tags                          = var.tags
}

#virtual network

module "virtual_network" {
  source                        = "../../resources/network/virtual_network"
  resource_group                = module.resource_group.name
  location                      = module.resource_group.location
  environment                   = var.environment
  location_short                = var.location_short
  name_prefix                   = "vnet"
  address_space                 = var.address_space
  tags                          = var.tags
}

###
# Subnets
###


module "app01-subnet" {
  source                        = "../../resources/network/subnet"
  resource_group                = module.resource_group.name
  location                       = var.location
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


module "route_table" {
  source                        = "../../resources/network/route_table"
  resource_group                = module.resource_group.name
  location                        = var.location
  location_short                = var.location_short
  environment                   = var.environment
  name_prefix                   = "rt"
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  next_hop_in_ip_address        =    var.next_hop_in_ip_address
  tags                          = var.tags
  depends_on                    = [module.app01-subnet,module.app02-subnet] 
  
}


module "route" {
 source                         = "../../resources/network/route"
  resource_group                = module.resource_group.name
  route_table_name              = module.route_table.name
  route_name                    = "defaultroute"
  location_short                = var.location_short
  environment                   = var.environment
  location                        = var.location
  address_prefix                = var.address_prefix
  next_hop_type                 = var.next_hop_type
  next_hop_in_ip_address        = var.next_hop_in_ip_address
  }


module "route_table_association_app01" {
  source                        = "../../resources/network/subnet_route_table_association"
  subnet_id                     = element(module.app01-subnet.id, 2)
  route_table_id                = module.route_table.id
}

module "route_table_association_app02" {
  source                        = "../../resources/network/subnet_route_table_association"
  subnet_id                     = element(module.app02-subnet.id,1)
  route_table_id                = module.route_table.id
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


