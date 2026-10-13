terraform {
  required_providers {
    stackit = {
      source  = "stackitcloud/stackit"
      version = "~> 0.119"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

locals {
  kubeconfig = try(yamldecode(ephemeral.stackit_ske_kubeconfig.stackit_ske.kube_config), null)
}

provider "stackit" {
  default_region           = var.stackit_region
  service_account_key_path = var.service_account_key_path
  use_oidc                 = false
  experiments              = ["ske"]
}

provider "kubernetes" {
  host                   = try(local.kubeconfig.clusters[0].cluster.server, null)
  client_certificate     = try(base64decode(local.kubeconfig.users[0].user["client-certificate-data"]), null)
  client_key             = try(base64decode(local.kubeconfig.users[0].user["client-key-data"]), null)
  cluster_ca_certificate = try(base64decode(local.kubeconfig.clusters[0].cluster["certificate-authority-data"]), null)
}

provider "helm" {
  kubernetes {
    host                   = try(local.kubeconfig.clusters[0].cluster.server, null)
    client_certificate     = try(base64decode(local.kubeconfig.users[0].user["client-certificate-data"]), null)
    client_key             = try(base64decode(local.kubeconfig.users[0].user["client-key-data"]), null)
    cluster_ca_certificate = try(base64decode(local.kubeconfig.clusters[0].cluster["certificate-authority-data"]), null)
  }
}