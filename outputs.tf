output "server_id" {
  value       = azurerm_sql_server.main.id
  description = "The ID of the Microsoft SQL Server"
}

output "server_fqdn" {
  value       = azurerm_sql_server.main.fully_qualified_domain_name
  description = "The fully qualified domain name of the Azure SQL Server."
}

output "server_name" {
  value       = azurerm_sql_server.main.name
  description = "(Required) The name of this Microsoft SQL Server"
}

output "server_admin_name" {
  value       = azurerm_sql_server.main.administrator_login
  description = "The server's administrator login name."
}

output "database_ids" {
  value = {
    for database in azurerm_sql_database.main :
    database.name => database.id
  }
  description = "The SQL Database IDs. If you need to reference the database IDs in a script, see the example in the azurerm_sql_database resource documentation."
}
