output "billing_scope_id" {
  value       = data.azurerm_billing_mca_account_scope.this.id
  description = "The subscription's billing scope ID"
}

output "subscription_resource_id" {
  value       = azurerm_subscription.this.id
  description = "The subscription's resource ID"
}

output "subscription_guid" {
  value       = trimprefix(azurerm_subscription.this.id, "/providers/Microsoft.Subscription/aliases/")
  description = "The subscription's GUID"
}

output "subscription_id" {
  value = azurerm_subscription.this.subscription_id
}
