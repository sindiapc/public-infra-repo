terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sindiainfrastate"
    container_name       = "tfstate-${var.environment}"
    key                  = "terraform/${var.environment}/terraform.tfstate"
    environment          = "public"
  }
}

provider "azurerm" {
  features {}
  environment = "public"
}