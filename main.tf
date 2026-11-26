module "hub" {
  source = "./modules/hub"

  name                = "hub"
  suffix              = local.suffix
  address_space       = var.hub.address_space
  subnets             = var.hub.subnets
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
}

module "spoke" {
  source   = "./modules/spoke"
  for_each = var.spokes

  name                = each.key
  suffix              = local.suffix
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  hub_vnet_id         = module.hub.vnet_id # output -> input
  hub_vnet_name       = module.hub.vnet_name
  enable_nsg          = each.value.enable_nsg
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
}
