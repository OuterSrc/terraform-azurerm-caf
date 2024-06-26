variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = bool
}

variable "client_config" {
  description = "Client configuration object (see module README.md)."
}

variable "custom_network_interface_name" {
  default = {}
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name. Changing this forces a new resource to be created."
}

variable "private_dns" {
  default = {}
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group. Changing this forces a new resource to be created."
}

variable "resource_id" {}

variable "settings" {}

variable "subnet_id" {}

variable "subresource_names" {}
