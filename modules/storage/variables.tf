variable "storage_account_name" {
  description = "The name of the storage account. Must be between 3 and 24 characters in length and can contain only lowercase letters and numbers."
  type        = string
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24 && can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "Storage account name must be between 3 and 24 characters and contain only lowercase letters and numbers."
  }
}

variable "replication_type" {
  description = "Replication type: LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS"
  type        = string
  validation {
    condition     = var.replication_type in ["LRS", "GRS", "RA-GRS", "ZRS", "GZRS", "RA-GZRS"]
    error_message = "Must be one of: LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS."
  }
}

variable "access_tier" {
  description = "Access tier: Hot, Cool, or Archive"
  type        = string
  validation {
    condition     = var.access_tier in ["Hot", "Cool", "Archive"]
    error_message = "Access tier must be Hot, Cool, or Archive."
  }
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
  default     = "container-${var.environment}"
}

variable "container_access_type" {
  description = "Access type: private, blob, or container"
  type        = string
  default     = "private"
  validation {
    condition     = var.container_access_type in ["private", "blob", "container"]
    error_message = "Must be one of: private, blob, or container."
  }
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}


variable "enable_hns" {
  description = "Enable hierarchical namespace (for Data Lake Gen2)"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}
