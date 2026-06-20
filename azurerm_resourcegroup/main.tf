 resource "azurerm_resource_group" "assignment2" {

    for_each = var.rg-lab
  
  name = each.value.name
  location = each.value.location

 }