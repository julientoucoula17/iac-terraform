variable "name" {}

variable "resource_group_name" {}

variable "resource_group_location" {}

variable "virtual_network_name" {}

variable "virtual_network_id" {}

variable "subnet_address_prefixes" {
  default = ["10.0.3.0/24"]
}

variable "administrator_login" {}

variable "administrator_password" {
  sensitive = true
}

variable "backup_retention_days" {
  default = 7
}

variable "sku_name" {
  description = "Ex: B_Standard_B1ms, GP_Standard_D2ds_v4"
  default     = "B_Standard_B1ms"
}

variable "mysql_version" {
  default = "8.0.21"
}

variable "storage_size_gb" {
  default = 20
}

variable "storage_auto_grow_enabled" {
  default = true
}

variable "database_name" {
  default = "appdb"
}

variable "charset" {
  default = "utf8mb4"
}

variable "collation" {
  default = "utf8mb4_unicode_ci"
}

variable "web_app_ip_address" {
}