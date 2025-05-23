variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
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

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
  default     = null
}

variable "object_id" {
  description = "The object ID for the access policy"
  type        = string
  default     = null
}

variable "backend_rg" {
  description = "Backend Resource Group for TF state"
  type        = string
  default     = "tf-backend-${var.environment}"
}

variable "backend_sa" {
  description = "Backend Storage Account name"
  type        = string
}

variable "backend_container" {
  description = "Backend Storage Container name"
  type        = string
}
