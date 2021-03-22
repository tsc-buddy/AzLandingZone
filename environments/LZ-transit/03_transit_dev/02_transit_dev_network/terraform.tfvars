###
# Environment variables
###


#common

environment = "dev"
location      = "australiaeast"
location_short = "ae"

#virtual_network

address_space = ["10.1.0.0/16"]

#subnet

#address_prefix_bastion    = ["10.1.3.0/24"]
name_prefixes             = ["snet-app01", "snet-app02"]
address_prefix_app01      = ["10.1.1.0/24"]
address_prefix_app02      = ["10.1.2.0/24"]


#tags

tags = {
  terraform_managed = true
  Environment       = "dev"
  Application       = "TBC"
  CostCentre        = "TBC"
  ManagedBy         = "TBC"
  Owner             = "TBC"
  Support           = "TBC"
}

##route table
disable_bgp_route_propagation = true
address_prefix                = "0.0.0.0/0"
next_hop_in_ip_address        = "10.0.11.4"
next_hop_type                 = "VirtualAppliance"

subscription_id = "#{subscription_id}#"
tenant_id = "#{tenant_id}#"

subscription_id_hub = "#{subscription_id_hub}#"
tenant_id_hub = "#{tenant_id_hub}#"


# authentication - DO NOT LEAVE HERE - STORE THESE DETAILS SECURELY

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"
