module "stackit" {
  source = "../../modules/stackit"

  stage_name         = var.stage
  stackit_project_id = "52ed46cc-a486-4b75-b04f-7722f471bb7e"
  node_machine_type  = var.node_machine_type
  node_min_count     = var.node_min_count
  node_max_count     = var.node_max_count
}