variable "azure_tenant_id" {
  type        = string
  description = "The automation service principal's tenant ID"
}

variable "azure_client_id" {
  type        = string
  description = "The automation service principal's client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "The automation service principal's client secret"
  sensitive   = true
}

variable "azure_default_subscription_id" {
  type        = string
  description = "The default subscription for the automation service principal to authenticate with"
}

variable "mca_billing_account_id" {
  type        = string
  description = "The default tenant's billing scope account ID"
}

variable "azure_default_billing_profile_id" {
  type        = string
  description = "The target billing profile ID"
}

variable "invoice_section_id" {
  type        = string
  description = "The target invoice section ID"
}

variable "subscription_name" {
  type        = string
  description = "The new subscription name"
}

variable "workload" {
  type        = string
  description = "The new subscription workload"
  default     = "Production"

  validation {
    condition     = contains(["Production", "DevTest"], var.workload)
    error_message = "Workload must be Production or DevTest."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags"
}

variable "dbw_account_id" {
  type        = string
  description = "The Azure Databricks account ID"
}

variable "region" {
  type        = string
  description = "The Azure cloud region to deploy the Databricks workspace in"
  default     = "West US 2"
}

variable "dbw_workspace_name" {
  type        = string
  description = "The name of the workspace, without the `dbw` prefix"
  default     = null
  validation {
    condition     = !startswith(coalesce(var.dbw_workspace_name, "none"), "dbw-")
    error_message = "Can't start Databricks workspace name with the automatically applied prefix"
  }
}

variable "sku" {
  type        = string
  description = "The Databricks SKU"
  validation {
    condition     = contains(["standard", "premium", "trial"], var.sku)
    error_message = "Sku must be `standard`, `premium`, or `trial`."
  }
}

variable "public_access_network_enabled" {
  type        = bool
  description = "Allow public access to the workspace"
  default     = true
}
