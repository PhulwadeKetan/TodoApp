data "azurerm_key_vault" "kv" {
  name                = "kv-todoapp-ketan"
  resource_group_name = "rg-ketan"
}

data "azurerm_key_vault_secret" "sql_user" {
  name         = "sqlusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "sql_pass" {
  name         = "sqlpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}

