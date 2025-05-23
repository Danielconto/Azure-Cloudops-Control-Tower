resource "azurerm_virtual_network" "example" {
  name                = "example-vnet-${var.environment}"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = var.subnet_prefix
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "example-ipconfig"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  source_image_reference {
    publisher = var.image_reference.publisher
    offer     = var.image_reference.offer
    sku       = var.image_reference.sku
    version   = var.image_reference.version
  }
}

resource "azurerm_virtual_machine_scale_set" "example" {
  name                = "example-vmss-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.vmss_size
    tier     = "Standard"
    capacity = var.instance_count
  }

  upgrade_policy {
    mode = "Automatic"
  }

  network_profile {
    name    = "example-network-profile"
    primary = true

    ip_configuration {
      name      = "example-ipconfig"
      subnet_id = azurerm_subnet.example.id
    }
  }

  os_profile {
    computer_name_prefix = "example-vmss"
    admin_username       = var.admin_username
    # Note: admin_password removed to avoid SSH conflict
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = var.ssh_public_key
    }
  }

  source_image_reference {
    publisher = var.image_reference.publisher
    offer     = var.image_reference.offer
    sku       = var.image_reference.sku
    version   = var.image_reference.version
  }
}

output "vm_id" {
  description = "The ID of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}

output "vmss_id" {
  description = "The ID of the virtual machine scale set"
  value       = azurerm_virtual_machine_scale_set.example.id
}

output "private_ip_address" {
  description = "The private IP address of the Linux virtual machine"
  value       = azurerm_network_interface.example.private_ip_address
}

output "nic_id" {
  description = "The ID of the VM's network interface"
  value       = azurerm_network_interface.example.id
}
