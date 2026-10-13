resource "stackit_ske_cluster" "stackit_ske" {
  project_id             = var.stackit_project_id
  name                   = "${var.stage_name}"

  node_pools = [
    {
      name               = "${var.stage_name}-pool"
      machine_type       = var.node_machine_type
      minimum            = var.node_min_count
      maximum            = var.node_max_count
      availability_zones = ["eu01-3"]
    }
  ]
}

ephemeral "stackit_ske_kubeconfig" "stackit_ske" {
    project_id   = stackit_ske_cluster.stackit_ske.project_id
    cluster_name = stackit_ske_cluster.stackit_ske.id != "" ? stackit_ske_cluster.stackit_ske.name : ""
}

resource "stackit_ske_kubeconfig" "kubeconfig" {
  project_id   = var.stackit_project_id
  cluster_name = stackit_ske_cluster.stackit_ske.name
  refresh      = true
}