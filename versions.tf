terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.2.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.8.1"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.4"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "TCLJ"
    workspaces {
      name = "iac-terraform-intro-cli"
    }
  }

  required_version = ">= 1.2.0"
}