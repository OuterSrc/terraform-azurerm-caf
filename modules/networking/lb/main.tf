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
  tags = merge(var.global_settings.tags, var.base_tags, local.module_tag, try(var.tags, null), try(var.settings.tags, null))
}
