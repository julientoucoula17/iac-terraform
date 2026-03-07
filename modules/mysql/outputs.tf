output "mysql_server_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "mysql_server_id" {
  value = azurerm_mysql_flexible_server.mysql.id
}

output "mysql_database_name" {
  value = azurerm_mysql_flexible_database.db.name
}