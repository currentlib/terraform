provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab" {
  name     = "pipeline-research-rg"
  location = "westeurope"
}

# Placeholder for Web App (Backend/Frontend)
resource "azurerm_service_plan" "plan" {
  name                = "research-plan"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
  os_type             = "Linux"
  sku_name            = "B1"
}