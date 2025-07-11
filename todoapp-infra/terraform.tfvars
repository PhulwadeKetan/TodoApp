rg_name           = "rg-ketan"
location          = "centralindia"
vault_name        = "kv-todoapp-ketan"
vm_username       = "vmadmin"
vm_password       = "Rajvee@2025"
sql_username      = "sqladmin"
sql_password      = "Rajvee@2025"
sql_server_name   = "todoapp-sqlserver-ketan"
sql_database_name = "todoappdb"
# vnet = {
#   frontend = {
#     name          = "todo-vnet"
#     address_space = ["10.0.0.0/16"]
#   }
# }
vnet_name     = "todo-vnet"
address_space = ["10.0.0.0/16"]
subnet = {
  frontend = {
    name             = "frontend-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  backend = {
    name             = "backend-subnet"
    address_prefixes = ["10.0.2.0/24"]
  }

}

public_ip = {
  frontend = {
    name              = "todoapp-frontend-pip"
    allocation_method = "Static"
  }
  backend = {
    name              = "todoapp-backend-pip"
    allocation_method = "Static"
  }
}

vm = {
  frontend = {
    name            = "frontend-vm"
    vm_size         = "Standard_B1s"
    vm_type         = "frontend"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-focal"
    image_sku       = "20_04-lts"
    image_version   = "latest"
  }
  backend = {
    name            = "backend-vm"
    vm_size         = "Standard_B1s"
    vm_type         = "backend"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-focal"
    image_sku       = "20_04-lts"
    image_version   = "latest"
  }
}

# vms = {
#   frontend = ""
#   backend  = ""
# }

