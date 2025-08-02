resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]

  tags = {
    Environment = var.environment
    Module      = "networking"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vnet_name}-nsg-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = var.environment
    Module      = "networking"
  }
}

resource "azurerm_network_security_rule" "allow_http" {
  name                        = "Allow-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "192.168.1.0/24"  # Replace with trusted IP range
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "allow_https" {
  name                        = "Allow-HTTPS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "192.168.1.0/24"  # Replace with trusted IP range
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "cloudops_pip" {
  name                = "cloudops-pip-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    Environment = var.environment
    Module      = "networking"
  }
}

resource "azurerm_network_interface" "cloudops_nic" {
  name                = "cloudops-nic-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cloudops_pip.id
  }

  tags = {
    Environment = var.environment
    Module      = "networking"
  }
}
