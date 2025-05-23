variable "environment" {
  description = "The environment for the deployment (e.g., staging, dev, prod)"
  type        = string
  default     = "staging"

  validation {
    condition     = contains(["staging", "dev", "prod"], var.environment)
    error_message = "Environment must be one of: staging, dev, prod."
  }
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "eastus"

  validation {
    condition     = can(regex("^[a-z]+[a-z0-9]*$", replace(var.location, " ", "")))
    error_message = "Location must be a valid Azure region (e.g., eastus, westus2)."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "my-resource-group-staging"

  validation {
    condition     = can(regex("^[-\\w]+$", var.resource_group_name))
    error_message = "Resource group name must include only letters, numbers, dashes, and underscores."
  }
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID"
  type        = string
  default     = null
}

variable "object_id" {
  description = "The object ID of the user or service principal"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the storage account used for backend state"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3–24 characters and use only lowercase letters and numbers."
  }
}

variable "container_name" {
  description = "Name of the container for the Terraform state"
  type        = string
  default     = "tfstate-${var.environment}"
}
