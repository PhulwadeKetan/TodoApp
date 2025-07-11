resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

    tags = {
    Owner = "Ketan" # 👈 Required tag to pass the policy
  }
}

