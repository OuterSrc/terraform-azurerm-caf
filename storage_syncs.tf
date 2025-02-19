module "storage_syncs" {
  source   = "./modules/storage_sync"
  for_each = var.storage_syncs

  base_tags           = local.global_settings.inherit_tags
  global_settings     = local.global_settings
  location            = try(local.global_settings.regions[each.value.region], null)
  name                = each.value.name
  resource_group      = local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)]
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : null
}

output "storage_syncs" {
  value = module.storage_syncs
}
