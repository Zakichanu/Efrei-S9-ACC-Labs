#############################################################################
#data source for the subscription
data "azurerm_subscription" "current" {


} #############################################################################
#data source for the subscription setup logs features 
data "azurerm_resource_group" "rsg-efrei-lab-04" {
 name = "rsg-efrei-lab-04"
}

data "azurerm_log_analytics_workspace" "law-efrei-lab-04" {
    name = "law-efrei-lab-04"
    resource_group_name = data.azurerm_resource_group.rsg-efrei-lab-04.name
}

data "azurerm_storage_account" "staefreilab04" {
    name = "staefreilab04"
    resource_group_name = data.azurerm_resource_group.rsg-efrei-lab-04.name
}
