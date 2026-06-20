resource "azurerm_public_ip" "bastion_pip" {

  for_each = var.bastion_pip

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = each.value.allocation_method
  sku               = each.value.sku

}