terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
}

locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags = var.base_tags ? merge(
    local.module_tag,
    var.global_settings.tags,
    try(var.settings.tags, null)
  ) : try(var.settings.tags, null)

  resource_group = coalesce(
    try(var.resource_groups[var.client_config.landingzone_key][var.settings.resource_group_key], null),
    try(var.resource_groups[var.settings.lz_key][var.settings.resource_group_key], null),
    try(var.resource_groups[var.client_config.landingzone_key][var.settings.resource_group.key], null),
    try(var.resource_groups[var.settings.resource_group.lz_key][var.settings.resource_group.key], null)
  )
}
