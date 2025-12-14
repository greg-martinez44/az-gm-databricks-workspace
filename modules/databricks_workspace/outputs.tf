output "rg_name" {
  value       = azurerm_resource_group.rg_databricks.name
  description = "The Databricks resource group name"
}

output "rg_id" {
  value       = azurerm_resource_group.rg_databricks.id
  description = "The Databricks resource group ID"
}

output "rg_location" {
  value = azurerm_resource_group.rg_databricks.location
  description = "The Databricks resource group location"
}

output "dbw_id" {
  value       = azurerm_databricks_workspace.dbw.id
  description = "The Databricks workspace's Azure ID"
}

output "dbw_workspace_id" {
  value       = azurerm_databricks_workspace.dbw.workspace_id
  description = "The Databricks workspace's Databricks ID"
}

output "dbw_name" {
  value       = azurerm_databricks_workspace.dbw.name
  description = "The Databricks workspace name"
}

output "dbw_workspace_url" {
  value       = azurerm_databricks_workspace.dbw.workspace_url
  description = "The Databricks workspace URL"
}
