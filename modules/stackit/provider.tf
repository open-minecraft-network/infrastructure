# We only declare REQUIRED providers here. 
# We do not configure credentials here; that happens in the stage layer.
terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = ">= 0.35.0"
    }
  }
}