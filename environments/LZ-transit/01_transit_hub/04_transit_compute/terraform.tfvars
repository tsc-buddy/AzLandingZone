###
# Environment variables
###



###
# Common variables
###

environment = "hub"
location    = "australiaeast"
location_short = "ae"

###
# Vnet variables
###

address_space = ["10.0.0.0/16"]

###
# Subnet variables
###

address_prefix_vgw     = ["10.0.10.0/27"]
address_prefix_fw      = ["10.0.11.0/26"]
address_prefix_adds    = ["10.0.12.0/24"]
address_prefix_jumpbox = ["10.0.13.0/24"]
address_prefix_bastion = ["10.0.14.0/24"]
address_prefix_app01   = ["10.0.15.0/24"]
address_prefix_app02   = ["10.0.16.0/24"]

###
# Azure Firewall Rule variables
###

address_prefixes_hub_fw_rules = ["10.0.0.0/16"]
address_prefixes_spokes_fw_rules =["10.2.0.0/16","10.1.0.0/16"]
address_prefixes_all_fw_rules = ["10.0.0.0/16","10.2.0.0/16","10.1.0.0/16"]


###
# Domain Controller variables
###

private_ip_address_adds = ["10.0.12.10", "10.0.12.11"]

###
# Tagging variables
###

tags = {
  terraform_managed = true
  Environment       = "hub"
}

subscription_id = "#{subscription_id}#"
tenant_id = "#{tenant_id}#"

subscription_id_hub = "#{subscription_id_hub}#"
tenant_id_hub = "#{tenant_id_hub}#"


# authentication - DO NOT LEAVE HERE - STORE THESE DETAILS SECURELY

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"
