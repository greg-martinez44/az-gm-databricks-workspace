variable "mca_billing_account_id" {
  type        = string
  description = "The default tenant's billing scope account ID"
}

variable "billing_profile_id" {
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
