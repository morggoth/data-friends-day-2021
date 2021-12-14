terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  tags = {
    env = "dfd-2021"
  }
}

resource "azurerm_resource_group" "this" {
  location = var.rg_location
  name     = var.rg_name

  tags = local.tags
}

resource "azurerm_databricks_workspace" "this" {
  name = var.db_name

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku = var.db_sku

  tags = local.tags
}
