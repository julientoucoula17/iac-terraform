variable "location" {
    default = "West Europe"
    }

variable "name" {
    default = "iac-infra"
    }


variable "subscription_id" {
  type = string
  sensitive = true
}
variable "client_id" {sensitive = true}
variable "client_secret" {sensitive = true}
variable "tenant_id" {sensitive = true}