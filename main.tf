resource "random_id" "web_id" {
  byte_length = 5
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Container Version
module "linux-webapp-1" {
  source              = "./modules/webapplinux"
  docker_image_name   = "julientoucoula17/taskflow:latest"
  docker_registry_url = "https://index.docker.io"
  app_settings = {
    PORT           = "8080"
    WEBSITES_PORT  = "8080"
    MYSQL_HOST     = module.mysql.mysql_server_fqdn
    MYSQL_USER     = var.mysql_admin_login
    MYSQL_PASSWORD = var.mysql_admin_password
    MYSQL_DB       = "appdb"
    MYSQL_PORT     = "3306"
  }
  name                          = "${var.name}-${random_id.web_id.hex}-test"
  resource_group_location       = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  sku_name                      = "P1v2"
  public_network_access_enabled = true
}

module "mysql" {
  source                  = "./modules/mysql"
  name                    = var.name
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  virtual_network_name    = azurerm_virtual_network.vnet.name
  virtual_network_id      = azurerm_virtual_network.vnet.id
  administrator_login     = var.mysql_admin_login
  administrator_password  = var.mysql_admin_password
  web_app_ip_address      = module.linux-webapp-1.web_app_ip_address[0]
}