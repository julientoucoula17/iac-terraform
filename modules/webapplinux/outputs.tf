output "service_plan_id" {
  value = azurerm_service_plan.service_plan.id
}

output "default_hostname" {
  value = azurerm_linux_web_app.web_app.default_hostname
}