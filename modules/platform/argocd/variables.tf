variable "chart_version" {
  description = "Helm chart version for ArgoCD"
  type        = string
  default     = "7.6.1" # Use a stable recent version
}

variable "namespace" {
  description = "Kubernetes namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "custom_values" {
  description = "Provider or environment specific helm values (e.g. ingress, node selectors)"
  type        = any
  default     = {}
}