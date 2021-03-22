###
# resource outputs
###

output "virtual_machine_id" {
  value       = module.virtual_machine.id
  description = "The ID of the Windows Virtual Machine."
}

output "subnet_id" {
  value       = module.subnet.id
  description = "The ID of the subnets."
  
}


output "nsg_id" {
  value       = module.network_security_group.id
  description = "The ID of the NSG."

}


output "network_interface_id" {
  value       = module.network_interface.id[0]
  description = "The ID of the NIC."
}
