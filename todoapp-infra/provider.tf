terraform {
  required_version = ">= 1.3.0"
  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
      #version = "~> 3.66.0"
    }
  }   
  # backend "azurerm" {
  #   # resource_group_name  = "ketan-rg"
  #   # storage_account_name = "strgtfstateketan"
  #   # container_name       = "tfstateketan"
  #   # key                  = "ketandevops.terraform.tfstate"

  # }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "51b6ad96-2bb6-48e5-b566-1d3406221d56"
  
}