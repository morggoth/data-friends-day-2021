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
  description = ""
  default     = "trial"
}

// DataBricks variables
variable "sas_token" {
  type        = string
  description = ""
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