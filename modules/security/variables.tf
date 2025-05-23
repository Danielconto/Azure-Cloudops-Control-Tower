variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "rg-${var.environment}"
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.tenant_id))
    error_message = "Must be a valid GUID."
  }
}

variable "object_id" {
  description = "User or service principal object ID"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.object_id))
    error_message = "Must be a valid GUID."
  }
}

variable "enable_purge_protection" {
  description = "Enable purge protection on Key Vault"
  type        = bool
  default     = false
}

variable "enable_defender" {
  description = "Enable Defender for Cloud"
  type        = bool
  default     = false
}

variable "key_permissions" {
  description = "List of key permissions"
  type        = list(string)
  default     = ["get", "list"]
  validation {
    condition = alltrue([
      for perm in var.key_permissions : perm in [
        "get", "list", "create", "delete", "update", "import",
        "backup", "restore", "recover", "purge"
      ]
    ])
    error_message = "Invalid key permission specified. Allowed values are: get, list, create, delete, update, import, backup, restore, recover, purge."
  }
}

variable "secret_permissions" {
  description = "List of secret permissions"
  type        = list(string)
  default     = ["get", "list"]
  validation {
    condition = alltrue([
      for perm in var.secret_permissions : perm in [
        "get", "list", "set", "delete", "backup", "restore",
        "recover", "purge"
      ]
    ])
    error_message = "Invalid secret permission specified. Allowed values are: get, list, set, delete, backup, restore, recover, purge."
  }
}

variable "certificate_permissions" {
  description = "List of certificate permissions"
  type        = list(string)
  default     = ["get", "list"]
  validation {
    condition = alltrue([
      for perm in var.certificate_permissions : perm in [
        "get", "list", "delete", "create", "import", "update",
        "managecontacts", "getissuers", "listissuers", "setissuers",
        "deleteissuers", "manageissuers", "recover", "backup",
        "restore", "purge"
      ]
    ])
    error_message = "Invalid certificate permission specified. Refer to Azure Key Vault docs for valid values."
  }
}

variable "tags" {
  description = "Map of tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}
