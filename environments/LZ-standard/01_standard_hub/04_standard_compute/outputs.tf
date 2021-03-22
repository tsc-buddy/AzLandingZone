###
# Environment outputs
###


output "subnet_id_adds" {
  value       = module.domain_controllers.subnet_id
  description = "The ids of the subnets."
}

# output "subnet_id_jumpbox" {
#   value       = module.windows_jumpbox.subnet_id
#   description = "The ids of the subnets."
# }

output "bastion_id" {
  value       = module.bastion.bastion_id
  description = "The id of the Bastion host."
}

output "bastion_pip_id" {
  value       = module.bastion.bastion_pip_id
  description = "The ids of the Bastion host public IP."
}
