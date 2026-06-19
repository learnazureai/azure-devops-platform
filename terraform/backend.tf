terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devops-platform"
    storage_account_name = "stdevops27978"
    container_name       = "tfstate"
    key                  = "devops-platform.tfstate"
  }
}
