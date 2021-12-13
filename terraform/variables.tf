// Resource group variables
variable "rg_name" {
  type        = string
  description = "Name of the main resource group"
  default     = "datafriends"
}

variable "rg_location" {
  type        = string
  description = "Location of the main resource group"
  default     = "northeurope"
}

// Databricks variables
variable "db_name" {
  type        = string
  description = "Name of the Databricks workspace"
  default     = "dbdatafriends"
}

variable "db_sku" {
  type        = string
  description = "Pricing Tier for the cluster"
  default     = "trial"
}

// Storage variables
variable "sas_token" {
  type        = string
  description = "The token required to access the storage"
  sensitive   = true
}

variable "container_name" {
  type        = string
  description = "Name of the storage container"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "db_node_min_cpu" {
  type        = number
  description = "The minimum number of CPU cores for a cluster node"
  default     = 4
}

variable "db_node_min_mem" {
  type        = number
  description = "The minimum amount of RAM in GBs for a cluster node"
  default     = 14
}

variable "db_node_category" {
  type        = string
  description = "Type of a node to the cluster"
  default     = "General Purpose"
}