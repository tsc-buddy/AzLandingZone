###
# Management group details
##

resource "azurerm_management_group" "dev_management_group" {
  name             = "Development"
  subscription_ids = [
    data.azurerm_subscription.current.subscription_id
  ]
}