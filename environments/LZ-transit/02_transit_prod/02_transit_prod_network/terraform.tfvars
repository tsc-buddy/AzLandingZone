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
address_prefix_bastion    = ["10.2.3.0/24"]
name_prefixes             = ["snet-app01", "snet-app02"]
policy_name               = ["app01","app02"]
address_prefix_app01      = ["10.2.1.0/24"]
address_prefix_app02      = ["10.2.2.0/24"]

#tags

tags = {
  terraform_managed = true
}

##route table
disable_bgp_route_propagation = true
address_prefix                = "0.0.0.0/0"
next_hop_in_ip_address        = "10.0.11.4" ### Check that this matches the FW Subnet range in the HUB network. This is the first IP in the Subnet
next_hop_type                 = "VirtualAppliance"

subscription_id = "#{subscription_id}#"
tenant_id = "#{tenant_id}#"

subscription_id_hub = "#{subscription_id_hub}#"
tenant_id_hub = "#{tenant_id_hub}#"

app_id          = "#{app_id}#"
object_id       = "#{object_id}#"
client_secret   = "#{client_secret}#"