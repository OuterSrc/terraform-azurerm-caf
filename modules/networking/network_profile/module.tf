output "debug_ip_configuration" {
  value = {
    subnet_id = try(ip_configuration.value.subnet_id, null)
    lz_key = try(ip_configuration.value.lz_key, null)
    vnet_key = try(ip_configuration.value.vnet_key, null)
    subnet_key = try(ip_configuration.value.subnet_key, null)
    virtual_subnet_key = try(ip_configuration.value.virtual_subnet_key, null)
    landingzone_key = try(var.client_config.landingzone_key, null)
    networking_subnet_id = try(var.remote_objects.networking[ip_configuration.value.lz_key][ip_configuration.value.vnet_key].subnets[ip_configuration.value.subnet_key].id, null)
    networking_landingzone_subnet_id = try(var.remote_objects.networking[var.client_config.landingzone_key][ip_configuration.value.vnet_key].subnets[ip_configuration.value.subnet_key].id, null)
    virtual_networks_subnet_id = try(var.remote_objects.virtual_networks[ip_configuration.value.lz_key][ip_configuration.value.virtual_subnet_key].id, null)
    virtual_networks_landingzone_subnet_id = try(var.remote_objects.virtual_networks[var.client_config.landingzone_key][ip_configuration.value.virtual_subnet_key].id, null)
  }
}

resource "azurerm_network_profile" "this" {
  name                = var.settings.name
  location            = can(var.settings.location) ? var.settings.location : var.resource_group.location
  resource_group_name = var.resource_group.name
  tags                = merge(local.tags, try(var.settings.tags, null))

  container_network_interface {
    name = var.settings.container_network_interface.name

    dynamic "ip_configuration" {
      for_each = var.settings.container_network_interface.ip_configurations

      content {
        name = ip_configuration.value.name
        subnet_id = coalesce(
          try(ip_configuration.value.subnet_id, null),
          try(var.remote_objects.networking[ip_configuration.value.lz_key][ip_configuration.value.vnet_key].subnets[ip_configuration.value.subnet_key].id, null),
          try(var.remote_objects.networking[var.client_config.landingzone_key][ip_configuration.value.vnet_key].subnets[ip_configuration.value.subnet_key].id, null),
          try(var.remote_objects.virtual_networks[ip_configuration.value.lz_key][ip_configuration.value.virtual_subnet_key].id, null),
          try(var.remote_objects.virtual_networks[var.client_config.landingzone_key][ip_configuration.value.virtual_subnet_key].id, null)
        )
      }
    }
  }
}

# local.combined_objects_networking.gitops_network.devops_region1.subnets.agent-level3.id
