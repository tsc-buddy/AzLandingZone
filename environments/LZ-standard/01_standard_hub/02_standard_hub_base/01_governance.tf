###
# Management group details
##

resource "azurerm_management_group" "hub_management_group" {
  name             = "Hub"
  subscription_ids = [
    data.azurerm_subscription.current.subscription_id
  ]
}