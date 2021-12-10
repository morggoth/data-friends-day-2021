terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.0"
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

resource "azurerm_resource_group" "main" {
  location = var.rg_location
  name     = var.rg_name

  tags = local.tags
}

resource "azurerm_storage_account" "main" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  name                     = var.sa_name

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  is_hns_enabled = true

  tags = local.tags
}

resource "azurerm_storage_container" "main" {
  name                 = var.sc_name
  storage_account_name = azurerm_storage_account.main.name
//  container_access_type = "container"
}

resource "azurerm_databricks_workspace" "main" {
  name = var.db_name

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku = var.db_sku

//  custom_parameters {
//    storage_account_name = azurerm_storage_account.main.name
//    storage_account_sku_name = "${azurerm_storage_account.main.account_tier}_${azurerm_storage_account.main.account_replication_type}"
//  }

  tags = local.tags
}

provider "databricks" {
  host = azurerm_databricks_workspace.main.workspace_url
}

//data "databricks_spark_version" "lts" {
//  long_term_support = true
//
//  depends_on = [azurerm_databricks_workspace.main]
//}

//resource "databricks_cluster" "this" {
//  cluster_name  = var.db_name
////  spark_version = data.databricks_spark_version.lts.id
//  spark_version = "azurerm_storage_container"
//  node_type_id            = "9.1.x-scala2.12"
//
//  spark_conf = {
//    "spark.databricks.cluster.profile" : "singleNode"
//    "spark.master" : "local[*]"
//  }
//
//  custom_tags = {
//    "ResourceClass" = "SingleNode"
//  }
//}
