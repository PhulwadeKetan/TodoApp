


resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vm
  name                            = each.value.name
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.vm_user.value
  admin_password                  = data.azurerm_key_vault_secret.vm_pass.value
  # tfsec:ignore:azure-compute-disable-password-authentication because password login is required for dev
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  # 👇 Add this block for Nginx installation only on frontend VMs
  custom_data = each.value.vm_type == "frontend" ? base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
  ) : null
}


resource "azurerm_network_interface" "nic" {
  for_each            = var.vm
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
