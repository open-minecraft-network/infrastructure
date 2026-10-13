output "kube_config_raw" {
  description = "Raw kubeconfig string for the SKE cluster"
  value       = stackit_ske_kubeconfig.kubeconfig.kube_config
  sensitive   = true
}