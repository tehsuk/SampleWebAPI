terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pl_samplewebapi_tf_storage_rg"
    storage_account_name = "plsamplewebapi"
    container_name       = "tfstate"
    key                  = "codelab.microsoft.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  features {}
  org_service_url = var.azdo_org_service_url
}