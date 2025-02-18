resource "azurerm_storage_sync" "service" {
  incoming_traffic_policy = try(var.incoming_traffic_policy, null)
  location                = var.location
  name                    = var.name
  resource_group_name     = var.resource_group_name
  tags                    = var.tags
}
