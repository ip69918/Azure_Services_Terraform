resource "azurerm_storage_account" "example" {
  name                     = "usersynapsestorage1"
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true
}

resource "azurerm_storage_data_lake_gen2_filesystem" "example" {
  name               = "datalakedemo"
  storage_account_id = azurerm_storage_account.example.id


  depends_on = [azurerm_storage_account.example]
}


resource "azurerm_synapse_workspace" "example" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = azurerm_resource_group.example_rg.name
  location                             = azurerm_resource_group.example_rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.example.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "user@123"

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Env = "production"
  }

    depends_on = [
    azurerm_storage_account.example,
    azurerm_storage_data_lake_gen2_filesystem.example
  ]
}
