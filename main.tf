resource "random_id" "administrator_login" {
  byte_length = 3
  keepers = {
    mssql_server_id = local.server_name
  }
}

resource "random_password" "administrator_password" {
  length  = 24
  special = true
  keepers = {
    mssql_server_id = local.server_name
  }
}

resource "random_id" "server_name" {
  byte_length = 4
}

resource "azurerm_sql_server" "main" {
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  name                         = local.server_name
  version                      = var.server_version
  administrator_login          = random_id.administrator_login.hex
  administrator_login_password = random_password.administrator_password.result

  tags = var.tags
}

resource "azurerm_sql_active_directory_administrator" "main" {
  server_name         = azurerm_sql_server.main.name
  resource_group_name = data.azurerm_resource_group.main.name
  login               = var.admin_login_name
  tenant_id           = var.tenant_id
  object_id           = var.admin_object_id
}

resource "azurerm_sql_database" "main" {
  for_each = var.database

  resource_group_name              = data.azurerm_resource_group.main.name
  location                         = data.azurerm_resource_group.main.location
  name                             = each.value["name"]
  server_name                      = azurerm_sql_server.main.name
  edition                          = each.value["edition"]
  requested_service_objective_name = each.value["requested_service_objective_name"]
  tags                             = var.tags
}
