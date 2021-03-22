###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "network"
  location       = var.location
  location_short           = var.location_short
  environment  = var.environment
  tags         = var.tags
}

#virtual network

module "virtual_network" {
  source         = "../../resources/network/virtual_network"
  resource_group = module.resource_group.name
  location         = module.resource_group.location
  environment    = var.environment
  location_short           = var.location_short
  name_prefix    = "vnet"
  address_space  = var.address_space
  dns_servers    = var.dns_servers
  tags           = var.tags
}

###
# Subnets
###


module "app01-subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = module.resource_group.name
  location               = var.location
  location_short           = var.location_short
  virtual_network_name = module.virtual_network.name
  name_prefixes        = ["snet-app01"]
  address_prefixes     = var.address_prefix_app01
  environment          = var.environment
}

module "app02-subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = module.resource_group.name
  location               = var.location
  location_short           = var.location_short
  virtual_network_name = module.virtual_network.name
  name_prefixes        = ["snet-app02"]
  address_prefixes     = var.address_prefix_app02
  environment          = var.environment
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

###
# route table
###

module "route_table" {
  source         = "../../resources/network/route_table"
  resource_group = module.resource_group.name
  location         = var.location
  location_short           = var.location_short
  environment    = var.environment
  name_prefix    = "rt"
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  next_hop_in_ip_address        = var.next_hop_in_ip_address
  tags           = var.tags
}

module "route" {
 source         = "../../resources/network/route"
  resource_group         = module.resource_group.name
  route_table_name       = module.route_table.name
  route_name             = "defaultroute"
  location_short         = var.location_short
  environment            = var.environment
  location               = var.location
  address_prefix         = var.address_prefix
  next_hop_type          = var.next_hop_type
  next_hop_in_ip_address = module.firewall.private_ip_address
  }

module "route_table_association_app01" {
  source                    = "../../resources/network/subnet_route_table_association"
  subnet_id                 = element(module.app01-subnet.id, 2)
  route_table_id             = module.route_table.id
}

module "route_table_association_app02" {
  source                    = "../../resources/network/subnet_route_table_association"
  subnet_id                 = element(module.app02-subnet.id,1)
  route_table_id             = module.route_table.id
}




#virtual gateway

module "public_ip_vgw" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  location          = module.resource_group.location
  environment       = var.environment
  location_short    = var.location_short
  name_prefix       = "pip-vgw"
  allocation_method = "Dynamic"
  sku               = "Basic"
  tags              = var.tags
}

module "virtual_network_gateway" {
  source                = "../../resources/network/virtual_network_gateway"
  resource_group        = module.resource_group.name
  location              = module.resource_group.location
  location_short        = var.location_short
  environment           = var.environment
  virtual_network_name  = module.virtual_network.name
  public_ip_name        = module.public_ip_vgw.name
  public_ip_address_id  = module.public_ip_vgw.id
  address_prefixes      = var.address_prefix_vgw
  type                  = var.vgw_type
  sku                   = var.vgw_sku
  #vpn_client_protocols  = var.vpn_client_protocols
  address_space         = var.vpn_address_space
  #root_certificate_name = "P2SRootCert"
  #public_cert_data      = file("${path.module}/rootcertificate.cer")
  tags                  = var.tags
}

#firewall

module "public_ip_fw" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  location          = module.resource_group.location
  environment       = var.environment
  location_short    = var.location_short
  name_prefix       = "pip-fw"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "firewall" {
  source               = "../../resources/network/firewall"
  resource_group       = module.resource_group.name
  location             = module.resource_group.location
  environment          = var.environment
  location_short       = var.location_short
  virtual_network_name = module.virtual_network.name
  public_ip_address_id = module.public_ip_fw.id
  address_prefixes     = var.address_prefix_fw
  tags                 = var.tags
}


