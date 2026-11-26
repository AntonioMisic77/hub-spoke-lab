 # Code-to-Azure map (test environment)

    | Azure resource | Code: file and block | tfvars entry or key | Plan address |
    |---|---|---|---|
    | vnet-hub-test-weu | modules/hub/main.tf, azurerm_virtual_network "this" | hub.address_space | module.hub.azurerm_virtual_network.this |
    | snet-workload in vnet-spoke2-test-weu | | | |
    | peer-spoke1-to-hub | | | |
    | peer-hub-to-spoke2 | | | |
