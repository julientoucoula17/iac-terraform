output "service_plan_id" {
  value = azurerm_service_plan.service_plan.id
}

output "default_hostname" {
  value = azurerm_linux_web_app.web_app.default_hostname
}

output "web_app_id" {
  value = azurerm_linux_web_app.web_app.id
}

output "web_app_name" {
  value = azurerm_linux_web_app.web_app.name
}

output "web_app_ip_address" {
  value = split(",", azurerm_linux_web_app.web_app.outbound_ip_addresses)
}