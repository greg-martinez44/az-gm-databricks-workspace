resource "azurerm_resource_group" "rg_databricks" {
  name     = "rg-${var.dbw_workspace_name}"
  location = var.region
  tags = merge({
    createdOn = timestamp()
  }, var.tags)
  lifecycle {
    ignore_changes = [
      tags["createdOn"]
    ]
  }
}

resource "azurerm_databricks_workspace" "dbw" {
  name                                  = "dbw-${var.dbw_workspace_name}"
  resource_group_name                   = azurerm_resource_group.rg_databricks.name
  location                              = azurerm_resource_group.rg_databricks.location
  sku                                   = var.sku
  managed_resource_group_name           = "mrg-${var.dbw_workspace_name}"
  public_network_access_enabled         = var.public_access_network_enabled
  network_security_group_rules_required = var.public_access_network_enabled ? "AllRules" : "NoAzureDatabricksRules"
  tags = merge({
    createdOn = timestamp()
  }, var.tags)
  lifecycle {
    ignore_changes = [
      tags["createdOn"]
    ]
  }
}

data "databricks_metastores" "all" {}

data "databricks_metastore" "this" {
  for_each     = data.databricks_metastores.all.ids
  metastore_id = each.value
}

locals {
  region_metastore_id = try(coalesce([for m in data.databricks_metastore.this : m.region == azurerm_resource_group.rg_databricks.location ? m.id : null])[0], null)
}

resource "databricks_metastore" "this" {
  count         = local.region_metastore_id == null ? 1 : 0
  name          = "metastore_azure_${azurerm_resource_group.rg_databricks.location}"
  force_destroy = true
  owner         = "sp-admin-automation"
}

resource "databricks_metastore_assignment" "this" {
  metastore_id = try(databricks_metastore.this[0].id, local.region_metastore_id)
  workspace_id = azurerm_databricks_workspace.dbw.workspace_id
}
