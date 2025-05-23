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

resource "azurerm_resource_group" "staging" {
  name     = "staging-rg-${var.environment}"
  location = var.location
}

module "security" {
  source              = "../../modules/security"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.staging.name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}

module "networking" {
  source              = "../../modules/networking"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.staging.name
}

module "compute" {
  source              = "../../modules/compute"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.staging.name
}

module "storage" {
  source              = "../../modules/storage"
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.staging.name
}

output "resource_group_name" {
  description = "The name of the staging resource group"
  value       = azurerm_resource_group.staging.name
}

output "networking_output" {
  description = "Output from the networking module"
  value       = module.networking.some_output
}

output "compute_output" {
  description = "Output from the compute module"
  value       = module.compute.some_output
}

output "storage_output" {
  description = "Output from the storage module"
  value       = module.storage.some_output
}

output "some_output" {
  description = "Example output from the storage module"
  value       = module.storage.some_actual_output
}
