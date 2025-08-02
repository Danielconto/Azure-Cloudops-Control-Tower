output "key_vault_id" {
  description = "The unique identifier of the Azure Key Vault."
  value       = azurerm_key_vault.cloudops_keyvault.id
}

output "key_vault_name" {
  description = "The name of the Azure Key Vault."
  value       = azurerm_key_vault.cloudops_keyvault.name
}

output "key_vault_uri" {
  description = "The URI used to access the Key Vault."
  value       = azurerm_key_vault.cloudops_keyvault.vault_uri
}

output "key_vault_soft_delete_retention_days" {
  description = "The number of days soft-deleted items are retained in the Key Vault."
  value       = azurerm_key_vault.cloudops_keyvault.soft_delete_retention_days
}

output "key_vault_purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  value       = azurerm_key_vault.cloudops_keyvault.purge_protection_enabled
}

output "key_vault_summary" {
  description = "Grouped output of the key properties of the Key Vault."
  value = {
    id                         = azurerm_key_vault.cloudops_keyvault.id
    name                       = azurerm_key_vault.cloudops_keyvault.name
    uri                        = azurerm_key_vault.cloudops_keyvault.vault_uri
    soft_delete_retention_days = azurerm_key_vault.cloudops_keyvault.soft_delete_retention_days
    purge_protection_enabled   = azurerm_key_vault.cloudops_keyvault.purge_protection_enabled
  }
}
