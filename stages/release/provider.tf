terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = ">= 0.80.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30.0"
    }
  }
}

provider "stackit" {
  service_account_key_path = var.stackit_service_account_key_path
  default_region           = "eu01"
}

locals {
  kubeconfig = yamldecode(module.stackit.kubeconfig_raw)
}

# Helm provider for ArgoCD
provider "helm" {
  kubernetes {
    host                   = local.kubeconfig.clusters[0].cluster.server
    cluster_ca_certificate = base64decode(local.kubeconfig.clusters[0].cluster["certificate-authority-data"])
    client_certificate     = base64decode(local.kubeconfig.users[0].user["client-certificate-data"])
    client_key             = base64decode(local.kubeconfig.users[0].user["client-key-data"])
  }
}

# Kubernetes provider for Secrets and Manifests
provider "kubernetes" {
  host                   = local.kubeconfig.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local.kubeconfig.clusters[0].cluster["certificate-authority-data"])
  client_certificate     = base64decode(local.kubeconfig.users[0].user["client-certificate-data"])
  client_key             = base64decode(local.kubeconfig.users[0].user["client-key-data"])
}