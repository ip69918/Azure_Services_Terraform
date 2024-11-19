resource "azurerm_log_analytics_workspace" "example" {
  name                = "jelly-log-analytics"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "example" {
  name                       = "jelly-app-environment"
  location                   = azurerm_resource_group.example_rg.location
  resource_group_name        = azurerm_resource_group.example_rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}


resource "azurerm_container_app" "example" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = azurerm_resource_group.example_rg.name
  revision_mode                = "Single"

   template {
    container {
      name   = "examplecontainerapp"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}