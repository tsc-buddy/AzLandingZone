#common

environment = "prd"
location    = "australiaeast"
location_short = "ae"


#tags

tags = {
  terraform_managed = true
  Environment       = "prd"
  Application       = "TBC"
  CostCentre        = "TBC"
  ManagedBy         = "TBC"
  Owner             = "TBC"
  Support           = "TBC"
}



###
# RSV
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


# authentication - DO NOT LEAVE HERE - STORE THESE DETAILS SECURELY

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"