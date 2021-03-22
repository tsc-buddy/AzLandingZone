###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "active-directory"
  location       = var.location
   location_short              = var.location_short
  environment  = var.environment
  tags         = var.tags
}

#network

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  location               = module.resource_group.location
  location_short              = var.location_short
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-adds"]
  address_prefixes     = var.address_prefix_adds
  environment          = var.environment
}

# module "route_table_association_app02" {
#   source                    = "../../resources/network/subnet_route_table_association"
#   subnet_id                 = element(module.subnet.id, 4)
#   route_table_id             = module.route_table.id
# }

#virtual machine

module "network_interface" {
  source                        = "../../resources/network/network_interface"
  resource_group                = module.resource_group.name
  location                      = module.resource_group.location
  environment                   = var.environment
   location_short               = var.location_short
  name_prefix                   = "nic-wvm-dc"
  nic_count                     = 1
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Static"
  private_ip_address            = var.private_ip_address_adds
  tags                          = var.tags
}

module "virtual_machine" {
  source                           = "../../resources/compute/windows_virtual_machine"
  resource_group                   = module.resource_group.name
  location                         = module.resource_group.location
  environment                      = var.environment
  location_short                   = var.location_short
  name_prefix                      = "wvm-dc"
  vm_count                         = 1
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "vmadmin "
  admin_password                   = "C0nn3ct10n@123"
  os_disk_storage_account_type     = "Standard_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size
  network_interface_ids            = module.network_interface.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "MicrosoftWindowsServer"
  source_image_reference_offer     = "WindowsServer"
  source_image_reference_sku       = "2019-Datacenter"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}






module "managed_disk" {
  source               = "../../resources/compute/managed_disk"
  resource_group       = module.resource_group.name
  location               = module.resource_group.location
  environment          = var.environment
  location_short              = var.location_short
  name_prefix          = "datadisk-wvm-dc"
  disk_count           = 1
  create_option        = "Empty"
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 60
  enable_zones         = true
  zones                = [1, 2]
  tags                 = var.tags
}

module "virtual_machine_data_disk_attachment" {
  source             = "../../resources/compute/virtual_machine_data_disk_attachment"
  managed_disk_id    = module.managed_disk.id
  virtual_machine_id = module.virtual_machine.id
  lun                = "0"
  caching            = "None"
}

#network security group

module "network_security_group" {
  source         = "../../resources/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  location         = module.resource_group.location
   location_short              = var.location_short
  policy_name    = "addsallow"
  tags           = var.tags
}

module "network_security_rule" {
  source                      = "../../resources/network/network_security_rule"
  resource_group              = module.resource_group.name
  location                      = module.resource_group.location
  location_short              = var.location_short
  network_security_group_name = module.network_security_group.name
  network_security_rules = [
    {
      name                       = "LDAP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP SSL"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP GC"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "3268"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP GC SSL"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "3269"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Kerberos"
      priority                   = 140
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "88"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DNS"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc"
      priority                   = 160
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SMTP"
      priority                   = 170
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, EPM"
      priority                   = 180
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS"
      priority                   = 190
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, DFSR (SYSVOL)"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "5722"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Windows Time"
      priority                   = 210
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "*"
      destination_port_range     = "123"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Kerberos change and set password"
      priority                   = 220
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "464"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DCOM, RPC, EPM"
      priority                   = 230
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DFSN, NetLogon, NetBIOS Datagram Service"
      priority                   = 240
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SOAP"
      priority                   = 250
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "9389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "NetLogon, NetBIOS Name Resolution"
      priority                   = 260
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DFSN, NetBIOS Session Service, NetLogon"
      priority                   = 270
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
  ]
}

module "subnet_network_security_group_association" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.subnet.id, 0)
  network_security_group_id = module.network_security_group.id
  
}

