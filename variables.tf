variable "resource_group_name" {
  description = "Resource group for every network"
  type        = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  description = "Environment code used in names"
  type        = string
  default     = "test"

  validation {
    condition     = length(var.environment) <= 4
    error_message = "Use a short code, e.g. test."
  }
}

variable "region_code" {
  type    = string
  default = "weu"
}

variable "hub" {
  type = object({
    address_space = list(string)
    subnets       = map(string)
  })
}

variable "spokes" {
  description = "One entry per spoke, keyed by spoke name"
  type = map(object({
    address_space = list(string)
    subnets       = map(string)
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}
