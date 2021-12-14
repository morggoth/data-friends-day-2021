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

// Databricks workspace variables
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
