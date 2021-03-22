###
# Management Group 
###

resource "azurerm_management_group" "prod_management_group" {
  name             = "Production"
  subscription_ids = [
    data.azurerm_subscription.current.subscription_id
  ]
}