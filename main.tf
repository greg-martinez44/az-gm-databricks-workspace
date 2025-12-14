module "subscription" {
  source = "./modules/subscription"
  providers = {
    azurerm = azurerm.base
  }
  mca_billing_account_id = var.mca_billing_account_id
  billing_profile_id     = var.azure_default_billing_profile_id
  invoice_section_id     = var.invoice_section_id
  subscription_name      = var.subscription_name
  workload               = var.workload
  tags                   = var.tags
}

module "databricks_workspace" {
  source = "./modules/databricks_workspace"
  providers = {
    azurerm    = azurerm.new
    databricks = databricks.account
  }
  dbw_workspace_name            = coalesce(var.dbw_workspace_name, var.subscription_name)
  sku                           = var.sku
  region                        = var.region
  public_access_network_enabled = var.public_access_network_enabled
  tags                          = var.tags
}
