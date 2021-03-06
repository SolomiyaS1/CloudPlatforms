resource "azurerm_resource_group" "observability" {
  name     = "${var.prefix}-observability-rg"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "${var.prefix}-la"
  location            = azurerm_resource_group.observability.location
  resource_group_name = azurerm_resource_group.observability.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  internet_ingestion_enabled = false
}
