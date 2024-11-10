data "azurerm_subnet" "subdata-blk" {
   for_each = var.sub_data
   name = each.value.name
   resource_group_name = each.value.resource_group_name
   virtual_network_name = each.value.virtual_network_name
}

