terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.70"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "dev-resource-group-${var.environment}"
  location = var.location
}

module "security" {
  source              = "../../modules/security"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}

module "networking" {
  source              = "../../modules/networking"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
}

module "compute" {
  source              = "../../modules/compute"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
}

module "storage" {
  source              = "../../modules/storage"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
}

output "resource_group_name" {
  value = azurerm_resource_group.dev.name
}
