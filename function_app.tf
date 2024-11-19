# Create an Azure Storage Account for the Function App (Azure Functions require a storage account)
resource "azurerm_storage_account" "function_storage" {
  name                     = "functionstorageacctask"
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

# Create the Function App Plan (App Service Plan)
resource "azurerm_service_plan" "function_app_plan" {
  name                     = "function-app-plan"
  location                 = azurerm_resource_group.example_rg.location
  resource_group_name      = azurerm_resource_group.example_rg.name
  os_type                  = "Windows"
  sku_name                 = "Y1"
}

# Create the Azure Function App
resource "azurerm_windows_function_app" "example_function" {
  name                       = var.Windows_function_name
  location                   = azurerm_resource_group.example_rg.location
  resource_group_name        = azurerm_resource_group.example_rg.name

  service_plan_id        = azurerm_service_plan.function_app_plan.id
  storage_account_name      = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  depends_on = [azurerm_storage_account.function_storage]

  site_config {}

}


