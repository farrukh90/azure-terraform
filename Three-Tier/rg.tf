resource "azurerm_resource_group" "example" {
  name     = "dev"
  location = "eastus"
  tags = {
      Created_by = "Production"
  }
}