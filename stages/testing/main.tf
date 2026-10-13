module "stackit" {
  source = "../../modules/stackit"

  stage_name               = "testing"
  stackit_project_id       = "52ed46cc-a486-4b75-b04f-7722f471bb7e"
  service_account_key_path = "../../modules/stackit/secrets/service_account.json"
  private_key_path         = "../../modules/stackit/secrets/service_account.pem"
  node_machine_type        = var.node_machine_type
  node_min_count           = var.node_min_count
  node_max_count           = var.node_max_count
}