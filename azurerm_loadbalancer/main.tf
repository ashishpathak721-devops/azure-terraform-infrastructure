resource "azurerm_lb" "lb" {

    for_each = var.loadbalancing
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration.name
    public_ip_address_id = each.value.frontend_ip_configuration.public_ip_address_id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.backend_pool
  loadbalancer_id = each.value.loadbalancer_id
  name            = each.value.name
}

resource "azurerm_lb_probe" "health_probe" {
  for_each = var.health_probe
name = each.value.name
loadbalancer_id = each.value.loadbalancer_id
protocol = each.value.protocol
port = each.value.port
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each = var.lb_rule
  loadbalancer_id                = each.value.loadbalancer_id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids = each.value.backend_address_pool_ids
  probe_id = each.value.probe_id
}

