resource "azurerm_network_interface_backend_address_pool_association" "lb-nic" {

  for_each = var.lb-nic
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = each.value.backend_address_pool_id
}

