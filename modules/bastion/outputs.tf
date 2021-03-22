###
#  module outputs
###

output "bastion_pip_id" {
  value       = module.public_ip.id
  description = "The ids of the Bastion host public IP."
}

output "bastion_id" {
  value       = module.bastion.id
  description = "The id of the Bastion host."
}