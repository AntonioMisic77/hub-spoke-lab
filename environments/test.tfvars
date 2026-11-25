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
}

tags = {
  owner = "u07"
}
