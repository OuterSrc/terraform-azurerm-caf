variable "base_tags" {}
variable "client_config" {}
variable "combined_diagnostics" {}
variable "combined_resources" {
  description = "Provide a map of combined resources for environment_variables_from_resources"
  default     = {}
}
variable "data_sources" {default = {}}
variable "diagnostic_profiles" {}
variable "dynamic_keyvault_secrets" {
  description = "Provide credentials for private image registries"
  default     = {}
}
variable "global_settings" {}
variable "location" {}
variable "resource_group_name" {}
variable "settings" {}
