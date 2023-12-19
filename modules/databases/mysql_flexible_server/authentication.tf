resource "azurerm_mysql_flexible_server_active_directory_administrator" "mysql" {
  for_each = try(var.settings.mysql_aad_admin, {})


  server_id   = azurerm_mysql_flexible_server.mysql.id
  identity_id = var.settings.mysql_aad_admin.managed_identity_id
  login       = "sqladmin"
  object_id   = var.settings.mysql_aad_admin.admin_group_object_id
  tenant_id   = var.settings.mysql_aad_admin.admin_group_tenant_id
}
