resource "azurerm_network_interface" "nic-blk" {
    for_each = var.vm 
    name = each.value.nic_name
    location = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
      name = each.value.ip_configuration.name
      subnet_id = data.azurerm_subnet.subdata-blk[each.value.subnet].id
      private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    }
}

