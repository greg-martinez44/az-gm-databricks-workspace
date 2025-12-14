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
