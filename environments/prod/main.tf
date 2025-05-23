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

resource "azurerm_resource_group" "prod" {
  name     = "prod-resource-group-${var.environment}"
  location = var.location
}

module "security" {
  source              = "../../modules/security"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.prod.name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}

module "networking" {
  source              = "../../modules/networking"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.prod.name
}

module "compute" {
  source              = "../../modules/compute"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.prod.name
}

module "storage" {
  source              = "../../modules/storage"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.prod.name
}

output "resource_group_name" {
  value = azurerm_resource_group.prod.name
}

output "networking_output" {
  value = module.networking.some_output
}

output "compute_output" {
  value = module.compute.some_output
}

output "storage_output" {
  value = module.storage.some_output
}
