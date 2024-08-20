module "diagnostics" {
  source = "../../diagnostics"

  resource_id       = azurerm_active_directory_domain_service.aadds.resource_id
  resource_location = azurerm_active_directory_domain_service.aadds.location
  diagnostics       = var.diagnostics
  profiles          = try(var.settings.diagnostic_profiles, {})
}