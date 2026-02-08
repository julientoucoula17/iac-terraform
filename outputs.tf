output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "app_service_plan_id" {
  value = module.linux-webapp-1.service_plan_id
}

output "linux_web_app_default_hostname" {
  value = module.linux-webapp-1.default_hostname
}