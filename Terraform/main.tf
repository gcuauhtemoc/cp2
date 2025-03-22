# Version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
# Proveedor de Azure
provider "azurerm" {
  features {}
  subscription_id = "de157a88-145f-47e5-82d7-ae0944b07e19"
  tenant_id       = "UNIR"
}

#Grupo de recursos
resource "azurerm_resource_group" "grupo_gcs_cp2" {
  name     = var.resource_group_name
  location = var.location
}
