output "subscription_id" {
  value       = data.tfe_outputs.source_workspace.nonsensitive_values.subscription_id
  description = "The Azure subscription's ID"
}

output "subscription_name" {
  value = data.tfe_outputs.source_workspace.nonsensitive_values.subscription_name
  description = "The Azure subscription's name"
}

output "rg_name" {
  value       = module.databricks_workspace.rg_name
  description = "The Databricks resource group name"
}

output "rg_id" {
  value       = module.databricks_workspace.rg_id
  description = "The Databricks resource group ID"
}

output "rg_location" {
  value = module.databricks_workspace.rg_location
  description = "The Databricks resource group's region"
}

output "dbw_id" {
  value       = module.databricks_workspace.dbw_id
  description = "The Databricks workspace's Azure ID"
}

output "dbw_workspace_id" {
  value       = module.databricks_workspace.dbw_workspace_id
  description = "The Databricks workspace's Databricks ID"
}

output "dbw_name" {
  value       = module.databricks_workspace.dbw_name
  description = "The Databricks workspace name"
}

output "dbw_workspace_url" {
  value       = module.databricks_workspace.dbw_workspace_url
  description = "The Databricks workspace URL"
}

