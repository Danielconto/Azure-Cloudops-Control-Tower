terraform {
  backend "azurerm" {
    resource_group_name  = var.backend_rg
    storage_account_name = var.backend_sa
    container_name       = var.backend_container
    key                  = "dev.tfstate"
  }
}
