output "key_vault_id" {
  description = "The unique identifier of the Azure Key Vault."
  value       = azurerm_key_vault.example.id
}

output "key_vault_name" {
  description = "The name of the Azure Key Vault."
  value       = azurerm_key_vault.example.name
}

output "key_vault_uri" {
  description = "The URI used to access the Key Vault."
  value       = azurerm_key_vault.example.vault_uri
}

output "key_vault_soft_delete_retention_days" {
  description = "The number of days soft-deleted items are retained in the Key Vault."
  value       = azurerm_key_vault.example.soft_delete_retention_days
}

output "key_vault_purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  value       = azurerm_key_vault.example.purge_protection_enabled
}

output "key_vault_summary" {
  description = "Grouped output of the key properties of the Key Vault."
  value = {
    id                         = azurerm_key_vault.example.id
    name                       = azurerm_key_vault.example.name
    uri                        = azurerm_key_vault.example.vault_uri
    soft_delete_retention_days = azurerm_key_vault.example.soft_delete_retention_days
    purge_protection_enabled   = azurerm_key_vault.example.purge_protection_enabled
  }
}
