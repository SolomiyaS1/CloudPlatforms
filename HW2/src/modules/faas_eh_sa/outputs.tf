output "azure_web_jobs_storage" { 
  value = azurerm_storage_account.faas_storage.primary_connection_string 
  sensitive = true
}

output "storage_account_connection_string" { 
  value = azurerm_storage_account.sa.primary_connection_string
  sensitive = true
}

output "storage_account_containername" { 
  value = azurerm_storage_container.events.name
  sensitive = true
}

output "azure_function_name" { 
  value = azurerm_function_app.faas.name
  sensitive = true
}
