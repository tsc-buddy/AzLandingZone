###
#  module outputs
###
output "id" {
  value       = module.key_vault.id
  description = "The key vault Resource ID."
}