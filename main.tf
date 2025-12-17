data "tfe_outputs" "source_workspace" {
  workspace    = var.tf_source_workspace_name
  organization = var.tf_organization_name
}

provider "azurerm" {
  features {}
  subscription_id = data.tfe_outputs.source_workspace.nonsensitive_values.subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}

provider "databricks" {
  host                = "https://accounts.azuredatabricks.net/"
  account_id          = var.dbw_account_id
  azure_tenant_id     = var.azure_tenant_id
  azure_client_id     = var.azure_client_id
  azure_client_secret = var.azure_client_secret
}

data "databricks_metastores" "all" {}

data "databricks_metastore" "this" {
  for_each     = data.databricks_metastores.all.ids
  metastore_id = each.value
}

locals {
  region_metastore_id_map = { for m in data.databricks_metastore.this : m.region => m.id }
}

module "databricks_workspace" {
  source                        = "./modules/databricks_workspace"
  dbw_workspace_name            = coalesce(var.dbw_workspace_name, data.tfe_outputs.source_workspace.nonsensitive_values.subscription_name)
  region_metastore_id_map = local.region_metastore_id_map
  sku                           = var.sku
  region                        = var.region
  public_access_network_enabled = var.public_access_network_enabled
  tags                          = var.tags
}
