provider "azurerm" {
    features {}
}


resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "trafficmanagerendpointTest"
  location = "West Europe"
}

resource "azurerm_traffic_manager_profile" "example" {
  name                = random_id.server.hex
  resource_group_name = azurerm_resource_group.example.name

  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = random_id.server.hex
    ttl           = 100
  }

  monitor_config {
    protocol                     = "http"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_traffic_manager_endpoint" "example" {
  name                = random_id.server.hex
  resource_group_name = azurerm_resource_group.example.name
  profile_name        = azurerm_traffic_manager_profile.example.name
  target              = "terraform.io"
  type                = "externalEndpoints"
  weight              = 100
}
