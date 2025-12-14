variable "region" {
  type        = string
  description = "The Azure region to deploy the workspace"
  default     = "West US 2"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags"
}

variable "dbw_workspace_name" {
  type        = string
  description = "The name of the workspace, without the `dbw` prefix"
  validation {
    condition     = !startswith(var.dbw_workspace_name, "dbw-")
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

variable "region_metastore_id_map" {
  type = map(string)
  description = "A map of regions and existing metastore IDs"
}
