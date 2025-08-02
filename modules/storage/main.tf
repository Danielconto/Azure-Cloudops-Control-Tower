resource "azurerm_storage_account" "cloudops_storage" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = var.replication_type
  access_tier               = var.access_tier
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true

  # Optional identity (for use with RBAC/Key Vault)
  identity {
    type = "SystemAssigned"
  }

  # Optional: Restrict public access and enforce secure transfer
  allow_blob_public_access = false
  is_hns_enabled           = var.enable_hns

  tags = merge(
    var.tags,
    {
      Environment = var.environment
      Module      = "storage"
    }
  )
}

resource "azurerm_storage_container" "cloudops_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.cloudops_storage.name
  container_access_type = var.container_access_type
}
