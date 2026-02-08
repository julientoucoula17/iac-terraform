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

module "linux-webapp-1" {
  source                        = "./modules/webapplinux"
  app_settings                  = { PORT = 8080 }
  name                          = var.name
  resource_group_location       = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  sku_name                      = "P1v2"
  public_network_access_enabled = true
}