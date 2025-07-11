
data "azurerm_public_ip" "pip" {
  for_each = var.public_ips

  name                = each.value.name
  resource_group_name = var.rg_name
}
data "azurerm_key_vault" "kv" {
  name                = "kv-todoapp-ketan"
  resource_group_name = "rg-ketan"
}

data "azurerm_key_vault_secret" "vm_user" {
  name         = "vmadminusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm_pass" {
  name         = "vmadminpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.name
  virtual_network_name = "todo-vnet"
  resource_group_name  = var.rg_name
}
