output "billing_scope_id" {
  value       = module.subscription.billing_scope_id
  description = "The subscription's billing scope ID"
}

output "subscription_resource_id" {
  value       = module.subscription.subscription_resource_id
  description = "The subscription's resource ID"
}

output "subscription_guid" {
  value       = module.subscription.subscription_guid
  description = "The subscription's GUID"
}

output "subscription_id" {
  value       = module.subscription.subscription_id
  description = "The subscription's ID"
}

output "rg_name" {
  value       = module.databricks_workspace.rg_name
  description = "The Databricks resource group name"
}

output "rg_id" {
  value       = module.databricks_workspace.rg_id
  description = "The Databricks resource group ID"
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

