resource "azurerm_linux_virtual_machine" "vm-blk" {
    for_each = var.virtualmachine
name = each.value.vm_name
location = each.value.location
resource_group_name = each.value.resource_group_name
size = each.value.size
network_interface_ids = [data.azurerm_network_interface.nic-blkdata[each.value.nicd].id]
admin_username = data.azurerm_key_vault_secret.user.value
admin_password = data.azurerm_key_vault_secret.pass.value
 disable_password_authentication = false

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
