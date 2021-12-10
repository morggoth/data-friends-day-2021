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

// Storage account variables
variable "sa_name" {
  type        = string
  description = "Name of the storage account"
  default     = "sadatafriends"
}

// Storage container variables
variable "sc_name" {
  type        = string
  description = "Name of the storage container"
  default     = "data"
}

// Databricks variables
variable "db_name" {
  type        = string
  description = "Name of the Databricks workspace"
  default     = "dbdatafriends"
}

variable "db_sku" {
  type        = string
  description = ""
  default     = "trial"
}