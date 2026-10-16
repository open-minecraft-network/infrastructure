variable "stackit_project_id" {
  description = "The STACKIT Project UUID"
  type        = string
}

variable "stackit_service_account_key_path" {
  description = "path to the service account key"
  type        = string
  sensitive   = true
}