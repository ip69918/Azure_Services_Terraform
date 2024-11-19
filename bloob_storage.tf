resource "azurerm_storage_account" "example_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example_container" {
  name                  = "userbloobstorage1"
  storage_account_id    = azurerm_storage_account.example_storage_account.id 
  container_access_type = "private"

  depends_on = [azurerm_storage_account.example_storage_account]
}
