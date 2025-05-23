variable "environment" {
  description = "The environment for the deployment (e.g., prod, staging, dev)"
  type        = string
  default     = "prod"

  validation {
    condition     = contains(["prod", "staging", "dev"], var.environment)
    error_message = "Environment must be one of: prod, staging, dev."
  }
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "East US"

  validation {
    condition     = can(regex("^[a-zA-Z ]+$", var.location))
    error_message = "Location must be a valid Azure region name."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "my-resource-group-prod"

  validation {
    condition     = can(regex("^[-\\w]+$", var.resource_group_name))
    error_message = "Resource group name must only include letters, numbers, dashes, and underscores."
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
    error_message = "Storage account name must be 3-24 characters long and contain only lowercase letters and numbers."
  }
}

variable "container_name" {
  description = "Name of the container for the Terraform state"
  type        = string
  default     = "tfstate-${var.environment}"
}
