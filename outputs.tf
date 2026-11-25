output "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  value       = module.hub.vnet_id
}

output "spoke_vnet_ids" {
  description = "Spoke VNet IDs, keyed by spoke name"
  value       = { for k, s in module.spoke : k => s.vnet_id }
}
