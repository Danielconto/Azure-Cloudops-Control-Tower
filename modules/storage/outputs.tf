output "storage_account_name" {
  description = "The name of the Azure Storage Account"
  value       = azurerm_storage_account.example.name
}

output "storage_account_primary_access_key" {
  description = "Primary access key for the storage account"
  value       = azurerm_storage_account.example.primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "Secondary access key for the storage account"
  value       = azurerm_storage_account.example.secondary_access_key
  sensitive   = true
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint for the storage account"
  value       = azurerm_storage_account.example.primary_blob_endpoint
}

output "storage_account_secondary_blob_endpoint" {
  description = "Secondary blob endpoint for the storage account"
  value       = azurerm_storage_account.example.secondary_blob_endpoint
}

output "storage_account_primary_queue_endpoint" {
  description = "Primary queue endpoint for the storage account"
  value       = azurerm_storage_account.example.primary_queue_endpoint
}

output "storage_account_secondary_queue_endpoint" {
  description = "Secondary queue endpoint for the storage account"
  value       = azurerm_storage_account.example.secondary_queue_endpoint
}

output "storage_account_primary_table_endpoint" {
  description = "Primary table endpoint for the storage account"
  value       = azurerm_storage_account.example.primary_table_endpoint
}

output "storage_account_secondary_table_endpoint" {
  description = "Secondary table endpoint for the storage account"
  value       = azurerm_storage_account.example.secondary_table_endpoint
}

output "storage_account_primary_file_endpoint" {
  description = "Primary file endpoint for the storage account"
  value       = azurerm_storage_account.example.primary_file_endpoint
}

output "storage_account_secondary_file_endpoint" {
  description = "Secondary file endpoint for the storage account"
  value       = azurerm_storage_account.example.secondary_file_endpoint
}

output "storage_container_url" {
  description = "Full URL of the blob container"
  value       = "${azurerm_storage_account.example.primary_blob_endpoint}${azurerm_storage_container.example.name}"
}
