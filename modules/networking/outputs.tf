output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.subnet.name
}

output "subnet_cidr" {
  description = "The CIDR block of the subnet"
  value       = azurerm_subnet.subnet.address_prefixes[0]
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "The name of the network security group"
  value       = azurerm_network_security_group.nsg.name
}

output "public_ip" {
  description = "The public IP address"
  value       = azurerm_public_ip.cloudops_pip.ip_address
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.cloudops_nic.id
}

output "networking" {
  description = "Grouped output of key networking resource attributes"
  value = {
    vnet_id     = azurerm_virtual_network.vnet.id
    vnet_name   = azurerm_virtual_network.vnet.name
    subnet_id   = azurerm_subnet.subnet.id
    subnet_name = azurerm_subnet.subnet.name
    subnet_cidr = azurerm_subnet.subnet.address_prefixes[0]
    nsg_id      = azurerm_network_security_group.nsg.id
    nsg_name    = azurerm_network_security_group.nsg.name
    public_ip   = azurerm_public_ip.cloudops_pip.ip_address
    nic_id      = azurerm_network_interface.cloudops_nic.id
  }
}
