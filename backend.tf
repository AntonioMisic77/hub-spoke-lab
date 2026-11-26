terraform {
  backend "azurerm" {
    use_azuread_auth     = true
    storage_account_name = "sttfstateu0721909"
    container_name       = "tfstate"
    key                  = "lab7-hub-spoke-test.terraform.tfstate"
  }
}
