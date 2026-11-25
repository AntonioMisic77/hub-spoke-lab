resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.name}-${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "snet-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value]
}

# Each VNet holds its own side of the peering
resource "azurerm_virtual_network_peering" "to_hub" {
  name                      = "peer-${var.name}-to-hub"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.this.name
  remote_virtual_network_id = var.hub_vnet_id
}

resource "azurerm_virtual_network_peering" "from_hub" {
  name                      = "peer-hub-to-${var.name}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.this.id
}

resource "azurerm_network_security_group" "workload" {
  count = var.enable_nsg ? 1 : 0

  name                = "nsg-${var.name}-${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "workload" {
  count = var.enable_nsg ? 1 : 0

  subnet_id                 = azurerm_subnet.this["workload"].id
  network_security_group_id = azurerm_network_security_group.workload[0].id
}
