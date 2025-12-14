data "azurerm_billing_mca_account_scope" "this" {
  billing_account_name = var.mca_billing_account_id
  billing_profile_name = var.billing_profile_id
  invoice_section_name = var.invoice_section_id
}

resource "azurerm_subscription" "this" {
  subscription_name = var.subscription_name
  billing_scope_id  = data.azurerm_billing_mca_account_scope.this.id
  workload          = var.workload
  tags = merge({
    createdOn = timestamp()
  }, var.tags)
  lifecycle {
    ignore_changes = [
      tags["createdOn"],
      tags["createdBy"]
    ]
  }
}

# data "azurerm_subscriptions" "this" {
#   display_name_prefix = var.subscription_name
#   depends_on          = [azurerm_subscription.this]
# }
