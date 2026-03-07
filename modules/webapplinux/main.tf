resource "azurerm_service_plan" "service_plan" {
  name                = "${var.name}-plan"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "${var.name}-web-app"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.service_plan.id
  public_network_access_enabled = var.public_network_access_enabled

  site_config {
    websockets_enabled = true
    application_stack{
      docker_image_name   = "julientoucoula17/taskflow:latest"
      docker_registry_url = "https://index.docker.io"
    }
    app_command_line = ""
    }

  app_settings = var.app_settings
}
