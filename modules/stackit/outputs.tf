output "kubeconfig_raw" {
  description = "Raw Kubeconfig of the SKE cluster"
  value       = stackit_ske_kubeconfig.cluster_kubeconfig.kube_config
  sensitive   = true
}

output "kms_keyring_id" {
  description = "The ID of the Minecraft KMS keyring"
  value       = stackit_kms_keyring.keyring_minecraft.keyring_id
}

output "kms_forward_proxy_key_id" {
  description = "The ID of the Velocity forward proxy KMS key"
  value       = stackit_kms_key.forward_proxy.key_id
}