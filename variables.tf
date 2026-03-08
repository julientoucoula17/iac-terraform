variable "location" {
  default = "West Europe"
}

variable "name" {
  default = "iac-infra"
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "mysql_admin_login" {
  default = "mysqladmin"
}

variable "mysql_admin_password" {
  type      = string
  sensitive = true
}