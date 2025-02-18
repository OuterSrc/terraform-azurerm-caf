
# resource "azurerm_storage_sync_server_endpoint" "server_endpoint" {
#   name                  = "example-storage-sync-server-endpoint"
#   storage_sync_group_id = azurerm_storage_sync_group.example.id
#   registered_server_id  = azurerm_storage_sync.example.registered_servers[0]

#   depends_on = [azurerm_storage_sync_cloud_endpoint.example]
# }