###
# Environment variables
###

environment = "hub"
location    = "australiaeast"
location_short = "ae"

###
# Tagging variables
###

tags = {
  terraform_managed = true
  Environment       = "hub"
  Application       = "TBC"
  CostCentre        = "TBC"
  ManagedBy         = "TBC"
  Owner             = "TBC"
  Support           = "TBC"
}


###
# RSV Varialbles 
###
sku = "Standard"
soft_delete_enabled = true


###
# Azure Policy Varialbles 
###

allowedlocations = ["australiasoutheast", "australiaeast"]
listOfAllowedVMSKUs = ["standard_b2s","standard_b1s","standard_d2","standard_d2_v2"]

subscription_id = "#{subscription_id}#"
tenant_id = "#{tenant_id}#"

subscription_id_hub = "#{subscription_id_hub}#"
tenant_id_hub = "#{tenant_id_hub}#"



# authentication - DO NOT LEAVE HERE - STORE THESE DETAILS SECURELY

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"