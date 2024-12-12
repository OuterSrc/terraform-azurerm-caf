#
# Managed identities from remote state
#

locals {
  managed_local_identities = flatten([
    for managed_identity_key in try(var.settings.virtual_machine_settings[local.os_type].identity.managed_identity_keys, []) : [
      var.managed_identities[var.client_config.landingzone_key][managed_identity_key].id
    ]
  ])

  managed_remote_identities = flatten([
    for lz_key, value in try(var.settings.virtual_machine_settings[local.os_type].identity.remote, []) : [
      for managed_identity_key in value.managed_identity_keys : [
        var.managed_identities[lz_key][managed_identity_key].id
      ]
    ]
  ])

  # Hard-coded Sentinel AMA UMI resource ID (Serco specific)
  sentinel_ama_identity = "/subscriptions/e65cade2-f04d-4cbc-b5cb-aa59cf2d5088/resourceGroups/rg-sga3p-slg-sentinel/providers/Microsoft.ManagedIdentity/userAssignedIdentities/id-sgp-slg-ama-win"

  provided_identities = try(var.settings.virtual_machine_settings[local.os_type].identity.managed_identity_ids, [])

  managed_identities = concat(local.sentinel_ama_identity, local.provided_identities, local.managed_local_identities, local.managed_remote_identities)
}
