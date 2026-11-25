resource_group_name = "rg-lab-u07"
environment         = "test"
region_code         = "weu"

hub = {
  address_space = ["10.0.0.0/16"]
  subnets       = { shared = "10.0.4.0/24" }
}

spokes = {
  spoke1 = {
    address_space = ["10.1.0.0/16"]
    subnets       = { workload = "10.1.1.0/24" }
  }
  spoke2 = {
    address_space = ["10.2.0.0/16"]
    subnets       = { workload = "10.2.1.0/24" }
  }
  spoke3 = {
    address_space = ["10.5.0.0/16"]
    subnets       = { workload = "10.5.1.0/24" }
    enable_nsg    = true
  }
}

tags = {
  owner = "u07"
}
