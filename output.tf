# Output the Storage Account Name
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example_storage_account.name
}

# Output the Data Factory Name
output "data_factory_name" {
  description = "The name of the Data Factory"
  value       = azurerm_data_factory.example_data_factory.name
}


#Output of the Azure FunctionApp
output "Windows_function_name" {
  description = "The name of the azure function app"
  value = azurerm_windows_function_app.example_function.name

}

output "synapse_workspace_id" {
  description = "The ID of the Synapse workspace"
  value       = azurerm_synapse_workspace.example.id
}

output "synapse_workspace_name" {
  description = "The name of the Synapse workspace"
  value       = azurerm_synapse_workspace.example.name
}

output "container_app_name" {
  description = "The name of container app"
  value       = azurerm_container_app.example.name
}

output "container_app_environment_id" {
  description  = "The name of the container app id"
  value        = azurerm_container_app_environment.example.id
}