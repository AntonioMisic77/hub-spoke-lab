resource "azurerm_network_security_group" "spoke1_workload" {
  name                = "nsg-spoke1-workload-${local.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
}

data "azurerm_subnet" "spoke1_workload" {
  name                 = "snet-workload"
  virtual_network_name = "vnet-spoke1-${local.suffix}"
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "spoke1_workload" {
  subnet_id                 = data.azurerm_subnet.spoke1_workload.id
  network_security_group_id = azurerm_network_security_group.spoke1_workload.id
}
