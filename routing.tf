resource "azurerm_route_table" "spokes" {
  name                = "rt-spokes-${local.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
}
