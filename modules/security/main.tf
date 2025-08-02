<<<<<<< HEAD
resource "azurerm_key_vault" "cloudops_keyvault" {
  name                        = "cloudops-keyvault-${var.environment}"
=======
resource "azurerm_key_vault" "kv" {
  name                        = "kv-keyvault-${var.environment}"
>>>>>>> 0d992328a0c9c70900c98c3d35b56e5afee59b45
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled    = var.enable_purge_protection

 tags = merge(var.tags, {
  Environment = var.environment
  Module      = "security"
})
}

<<<<<<< HEAD
resource "azurerm_key_vault_access_policy" "cloudops_policy" {
  key_vault_id              = azurerm_key_vault.cloudops_keyvault.id
=======
resource "azurerm_key_vault_access_policy" "kv-poli" {
  key_vault_id              = azurerm_key_vault.kv-poli.id
>>>>>>> 0d992328a0c9c70900c98c3d35b56e5afee59b45
  tenant_id                 = var.tenant_id
  object_id                 = var.object_id
  key_permissions           = var.key_permissions
  secret_permissions        = var.secret_permissions
 certificate_permissions = var.certificate_permissions

}

resource "azurerm_security_center_subscription_pricing" "defender" {
  count         = var.enable_defender ? 1 : 0
  tier          = "Standard"
  resource_type = "VirtualMachines"
}
