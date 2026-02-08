variable "name" {
}
variable "resource_group_name" {
}
variable "resource_group_location" {
}
variable "os_type" {
  default = "Linux"
}
variable "sku_name" {
  description = "Configuration du plan de facturation Azure"
}

variable "python_version" {
  default = "3.12"
}

variable "public_network_access_enabled" {
  default = false
}

variable "app_settings" {

}