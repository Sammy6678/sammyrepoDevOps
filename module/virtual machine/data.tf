data "azurerm_network_interface" "nic-blkdata" {
  for_each            = var.nic_data
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "vault-blk" {
  name                = "langeshvault2"
  resource_group_name = "langesh1"
}

data "azurerm_key_vault_secret" "user" {
  name         = "adminusername2"
  key_vault_id = data.azurerm_key_vault.vault-blk.id
}

data "azurerm_key_vault_secret" "pass" {
  name         = "password2"
  key_vault_id = data.azurerm_key_vault.vault-blk.id
}
