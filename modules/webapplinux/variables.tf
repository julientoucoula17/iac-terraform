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
  description = "Accessibilité via Internet ou pas"
  default = false
}

variable "docker_image_name" {}

variable "docker_registry_url" {
  default = "https://index.docker.io"
}

variable "app_settings" {
  default = {}
}