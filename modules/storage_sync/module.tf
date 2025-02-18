# module "storage_sync_service" {
#   source   = "./storage_sync_service"

#   incoming_traffic_policy = try(var.settings.incoming_traffic_policy, "AllowAllTraffic")
#   location                = local.location
#   name                    = var.settings.name
#   resource_group_name     = local.resource_group_name
#   tags                    = local.tags
# }

# # module "storage_sync_group" {
# #   for_each = var.groups

# # }
