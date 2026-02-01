terraform {
  required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
    version = "4.58.0"
      }
  }

/*  backend "local" {
    path = "states/local.tfstate"
  }*/

  backend "azurerm" {
    resource_group_name = "terraform-rg"
    storage_account_name = "tfstatetclstorageaccount"
    container_name = "terraformstate"
    key = "dev/terraform.tfstate"
  }

  required_version = ">= 1.2.0"
}