output "workspace_url" {
  value = azurerm_databricks_workspace.main.workspace_url
}

output "storage_container_id" {
  value = azurerm_storage_container.main.id
}