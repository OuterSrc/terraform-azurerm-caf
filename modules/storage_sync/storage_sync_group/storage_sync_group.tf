
# resource "azurerm_storage_sync_group" "group" {
#   name            = each.value.name
#   storage_sync_id = azurerm_storage_sync.service.id
# }

# resource "azurerm_storage_sync_cloud_endpoint" "cloud_endpoint" {
#   name                  = var.storage_sync_cloud_endpoint.name
#   storage_sync_group_id = azurerm_storage_sync_group.group.id
#   file_share_name       = azurerm_storage_share.example.name
#   storage_account_id    = azurerm_storage_account.example.id
# }
