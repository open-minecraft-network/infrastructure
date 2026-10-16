# You can use this file for local variables or data sources
locals {
  cluster_name = "ske-${var.environment}"
  db_name      = "db-${var.environment}"
}