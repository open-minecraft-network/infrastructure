# Create the STACKIT Kubernetes Engine (SKE) Cluster
resource "stackit_ske_cluster" "cluster" {
  project_id = var.stackit_project_id
  name       = local.cluster_name
  kubernetes_version_min = var.stackit_ske_version

  node_pools = [
    {
      availability_zones = [var.stackit_ske_availability_zones]
      name         = var.environment
      machine_type = var.stackit_ske_node_machine_type
      minimum      = var.stackit_ske_node_min_count
      maximum      = var.stackit_ske_node_max_count
    }
  ]
}

# Fetch the Kubeconfig automatically so Helm can use it later
resource "stackit_ske_kubeconfig" "cluster_kubeconfig" {
  project_id   = var.stackit_project_id
  cluster_name = stackit_ske_cluster.cluster.name
  refresh      = true
}