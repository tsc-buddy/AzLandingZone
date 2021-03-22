###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "jumpbox"
  location       = var.location
  location_short           = var.location_short
  environment  = var.environment
  tags         = var.tags
}

#subnet

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  location               = module.resource_group.location
  location_short       = var.location_short
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-jumpbox"]
  address_prefixes     = var.address_prefix_jumpbox
  environment          = var.environment
}

#virtual machine

module "network_interface" {
  source                        = "../../resources/network/network_interface"
  resource_group                = module.resource_group.name
  location                        = module.resource_group.location
  environment                   = var.environment
  location_short                = var.location_short
  name_prefix                   = "nic-wvm-jumpbox"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "virtual_machine" {
  source                           = "../../resources/compute/windows_virtual_machine"
  resource_group                   = module.resource_group.name
  location                           = module.resource_group.location
  environment                      = var.environment
  location_short                   = var.location_short
  name_prefix                      = "wvm-jumpbox"
  computer_name                    = "jumpbox"
  admin_username                   = "vmadmin"
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

#network security group

module "network_security_group" {
  source         = "../../resources/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  location         = module.resource_group.location
   location_short              = var.location_short
  policy_name    = "rdpallow"
  tags           = var.tags
}

module "network_security_rule" {
  source                      = "../../resources/network/network_security_rule"
  resource_group              = module.resource_group.name
  location                      = module.resource_group.location
   location_short              = var.location_short
  network_security_group_name = module.network_security_group.name
}

module "subnet_network_security_group_association" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.subnet.id, 0)
  network_security_group_id = module.network_security_group.id
}

