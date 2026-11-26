variable "name" {
  description = "Short name used in resource names, e.g. hub"
  type        = string
}

variable "suffix" {
  description = "Environment and region code, e.g. test-weu"
  type        = string
}

variable "address_space" {
  description = "Address space of the VNet"
  type        = list(string)
}

variable "subnets" {
  description = "Subnet name => address prefix"
  type        = map(string)
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub VNet"
  type        = string
}
variable "enable_nsg" {
  description = "Create an NSG for the workload subnet"
  type        = bool
  default     = false
}
