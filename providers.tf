terraform {
  required_version = "~> 1.14.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.56.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.99.0"
    }
  }
}

provider "azurerm" {
  features {}
  alias           = "base"
  subscription_id = var.azure_default_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}

provider "azurerm" {
  features {}
  alias           = "new"
  subscription_id = module.subscription.subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}

provider "databricks" {
  alias               = "account"
  host                = "https://accounts.azuredatabricks.net/"
  account_id          = var.dbw_account_id
  azure_tenant_id     = var.azure_tenant_id
  azure_client_id     = var.azure_client_id
  azure_client_secret = var.azure_client_secret
}
