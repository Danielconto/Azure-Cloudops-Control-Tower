# Core settings
environment           = "dev"
location              = "East US"
resource_group_name   = "rg-name"
tenant_id             = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
object_id             = "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"

# Networking variables
vnet_name             = "vnet-dev"
address_space         = ["10.0.0.0/16"]
subnet_name           = "subnet-name"
subnet_prefix         = "10.0.1.0/24"

# Compute variables
vm_size               = "Standard_DS1_v2"
image_reference = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
  version   = "latest"
}
instance_count        = 2

# Storage variables
storage_account_name  = "storacc-dev"
replication_type      = "LRS"
access_tier           = "Hot"
