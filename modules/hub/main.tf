resource "azurerm_virtual_network" "hub" {
  name                = "vnet-${var.name}-${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags = merge(var.tags, {
    change_source = "finance"
  })

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "snet-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [each.value]
}

moved {
  from = azurerm_virtual_network.this
  to   = azurerm_virtual_network.hub
}
