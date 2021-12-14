terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "databricks" {
  host = var.db_workspace_url
}

data "databricks_spark_version" "lts" {
  long_term_support = true
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