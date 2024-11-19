resource "azurerm_data_factory" "example_data_factory" {
  name                = var.data_factory_name
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}


