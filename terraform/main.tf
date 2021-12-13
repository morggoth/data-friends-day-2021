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

resource "azurerm_databricks_workspace" "main" {
  name = var.db_name

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku = var.db_sku

  tags = local.tags
}

provider "databricks" {
  host = azurerm_databricks_workspace.main.workspace_url
}

data "databricks_spark_version" "lts" {
  long_term_support = true

  //  depends_on = [azurerm_databricks_workspace.main]
}

data "databricks_node_type" "standard_node" {
  min_cores     = var.db_node_min_cpu
  min_memory_gb = var.db_node_min_mem
  category      = var.db_node_category
}

resource "databricks_cluster" "this" {
  cluster_name  = var.db_name
  spark_version = data.databricks_spark_version.lts.id
  node_type_id  = data.databricks_node_type.standard_node.id

  spark_conf = {
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
    "fs.azure.sas.${var.container_name}.${var.storage_account_name}.blob.core.windows.net" = var.sas_token
  }

  custom_tags = {
    "ResourceClass" = "SingleNode"
  }

  library {
    pypi {
      package = "geohash2==1.1"
    }
  }
}