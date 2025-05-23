variable "environment" {
  type        = string
  description = "Environment (e.g., dev, staging, prod)"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-${var.environment}"
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = string
  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", var.address_space))
    error_message = "Address space must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet-${var.environment}"
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", var.subnet_prefix))
    error_message = "Subnet prefix must be a valid CIDR block (e.g., 10.0.1.0/24)."
  }
}

variable "public_ip_name" {
  description = "Name of the Public IP resource"
  type        = string
  default     = "pip-${var.environment}"
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
  default     = "nic-${var.environment}"
}

variable "trusted_ip_range" {
  description = "Trusted IP range allowed for NSG inbound rules (CIDR format)"
  type        = string
  default     = "192.168.1.0/24"
  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", var.trusted_ip_range))
    error_message = "Must be a valid CIDR block."
  }
}
