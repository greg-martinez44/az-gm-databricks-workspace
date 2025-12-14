variable "tf_organization_name" {
  type        = string
  description = "The Terraform Cloud organization name"
  default     = "gm-practice-org"
}

variable "tf_source_workspace_name" {
  type        = string
  description = "The Terraform Cloud workspace that created the target subscription"
}

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
