provider "azurerm" {
	features {}
}


resource "azurerm_resource_group" "example" {
	name = "workflow-resources"
	location = "West Europe"
}

resource "azurerm_logic_app_workflow" "example" {
	name = "workflow1"
	location = azurerm_resource_group.example.location
	resource_group_name = azurerm_resource_group.example.name
}
