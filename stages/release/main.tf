module "stackit" {
  source = "../../modules/stackit"

  stackit_project_id = var.stackit_project_id
  environment        = "release"
}