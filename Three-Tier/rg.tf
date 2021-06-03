resource "azurerm_resource_group" "example" {
  name     = "dev"
  location = "eastus"
  tags = {
    "environment" = "dev"
  }
}