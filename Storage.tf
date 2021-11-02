

#Reference https://urldefense.com/v3/__https://github.com/hashicorp/terraform-provider-azurerm/__;!!P19mnmj49A!FdSxfCDkZPuSm7lmypukEBKPdbQSYLM6Skxkpukj4GhtjLI0ao6Jh-nrzGvvUufOpUe0$ 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.71.0"
	     }
  }
}

# Configure the Microsoft Azure Provider
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

  subscription_id = "65911ece-b772-4e16-ab25-fc95982846dc"
   client_id       = "37f075a8-9437-4317-84e7-8106b3c2c6a3"
   client_secret   = "ui8lG0EanXUt.M3ZM-T8P8krICoaEk.RS6"
   tenant_id       = "8a38d5c9-ff2f-479e-8637-d73f6241a4f0"
}


resource "azurerm_resource_group" "rg" {
  name     = "TestRGroup"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa" {
  name                     = "teststoracc101112"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}