resource "azurerm_subnet" "mysql_subnet" {
  name                 = "${var.name}-mysql-sn"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes

  service_endpoints = ["Microsoft.Storage"]

  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "${var.name}-mysql"
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = var.backup_retention_days
  sku_name               = var.sku_name
  version                = var.mysql_version

  storage {
    size_gb           = var.storage_size_gb
    auto_grow_enabled = var.storage_auto_grow_enabled
  }

}

resource "azurerm_mysql_flexible_database" "db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_mysql_flexible_server_configuration" "example" {
  name                = "require_secure_transport"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  value               = "OFF"
}

# Firewall rules permit access to azure services
resource "azurerm_mysql_flexible_server_firewall_rule" "azure_services_firewall" {
  name                = "${var.name}_AzureServicesFirewall"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# Firewall rules permit access to web app service
resource "azurerm_mysql_flexible_server_firewall_rule" "web_app_firewall" {
  name                = "${var.name}_WebAppFirewall"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = var.web_app_ip_address
  end_ip_address      = var.web_app_ip_address
}
