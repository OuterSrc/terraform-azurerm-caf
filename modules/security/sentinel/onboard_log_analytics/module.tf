resource "azurerm_sentinel_log_analytics_workspace_onboarding" "workspace_onboarding" {
  customer_managed_key_enabled = var.customer_managed_key_enabled
  workspace_id                 = var.log_analytics_workspace_id
}
