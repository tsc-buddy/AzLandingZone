###
# environment variables
###

#common

environment = "prd"
location      = "australiaeast"
location_short = "ae"



#virtual_network

address_space = ["10.2.0.0/16"]

#subnet
#address_prefix_bastion    = ["10.2.3.0/24"]
name_prefixes             = ["snet-app01", "snet-app02"]
policy_name               = ["app01","app02"]
address_prefix_app01      = ["10.2.1.0/24"]
address_prefix_app02      = ["10.2.2.0/24"]

###
# Tagging variables
###

tags = {
  terraform_managed = true
  Environment       = "prd"
}

subscription_id = "#{subscription_id}#"
tenant_id = "#{tenant_id}#"

subscription_id_hub = "#{subscription_id_hub}#"
tenant_id_hub = "#{tenant_id_hub}#"

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"