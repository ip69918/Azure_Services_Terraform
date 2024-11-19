# Azure Resource Group Location
variable "location" {
  description = "The Azure location where resources will be created"
  type        =  string
  default     = "Canada Central"

}

# Azure Resource Group Name
variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        =  string
  default     = "final_resource"
}

# Tenant ID for Azure AD
variable "tenant_id" {
  description = "The Azure Active Directory Tenant ID"
  type        = string
}

variable "Windows_function_name" {
  description = "The name of the azure functions name"
  type      = string  
}

# Storage Account Name
variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
}

# Data Factory Name
variable "data_factory_name" {
  description = "The name of the Azure Data Factory"
  type        = string
}

variable "synapse_workspace_name" {
  description = "The name of the Azure Synapse Workspace"
  type        = string
  
}

variable "container_app_name" {
  description = "The name of the container_app"
  type   =  string
}