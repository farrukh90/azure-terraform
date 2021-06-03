resource "azuread_user" "john" {
  user_principal_name = "jdoe@sfarrukhoutlook.onmicrosoft.com"
  display_name        = "J. Doe"
  mail_nickname       = "jdoe"
  password            = "SecretP@sswd99!"
  city                = "Chicago"
  mobile_phone        = "3123121123"
  company_name        = "evolvecyber"
  country             = "US"
  postal_code         = 60018
  state               = "IL"
  street_address      = "312 n State"
  office_location     = "Wacker drive"
  job_title           = "DevOps"
  department          = "IT"
}

data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.example.object_id
}