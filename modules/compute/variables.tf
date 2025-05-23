variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string

  validation {
    condition     = can(regex("^[a-z]+[a-z0-9]*$", replace(var.location, " ", "")))
    error_message = "Location must match Azure region naming convention (e.g., eastus, westeurope)."
  }
}

variable "resource_group_name" {
  description = "Resource group to deploy resources in"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "CIDR prefix for the subnet"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"

  validation {
    condition     = can(regex("^[A-Za-z0-9_]+$", var.vm_size))
    error_message = "VM size must be a valid Azure VM size (e.g., Standard_B2s)."
  }
}

variable "vmss_size" {
  description = "The size of the virtual machine scale set instances"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9_]+$", var.vmss_size))
    error_message = "VMSS size must be a valid Azure VM size (e.g., Standard_B2s)."
  }
}

variable "instance_count" {
  description = "Number of VMSS instances"
  type        = number
  default     = 1

  validation {
    condition     = var.instance_count > 0
    error_message = "Instance count must be greater than 0."
  }
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Public SSH key for VMSS authentication"
  type        = string
}

variable "image_reference" {
  description = "Source image reference for the VM and VMSS"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "vm-${var.environment}"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,64}$", var.vm_name))
    error_message = "VM name must be alphanumeric, up to 64 characters, with optional dashes."
  }
}
