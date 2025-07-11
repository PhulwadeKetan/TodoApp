# tfsec:ignore:azure-database-no-public-access because public access is required for dev environment

  # tfsec:ignore:azure-database-enable-audit
resource "azurerm_mssql_server" "sqlserver" {

  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.sql_user.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_pass.value
  minimum_tls_version = "1.2"
  public_network_access_enabled = true
}

resource "azurerm_mssql_firewall_rule" "allow_all_ips" {
  name             = "AllowAllIPs"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "103.134.167.91"
  end_ip_address   = "103.134.167.91"
}