provider "helm" {
  kubernetes {
    host                   = yamldecode(module.stackit.kube_config_raw).clusters[0].cluster.server
    cluster_ca_certificate = base64decode(yamldecode(module.stackit.kube_config_raw).clusters[0].cluster.certificate-authority-data)
    client_certificate     = base64decode(yamldecode(module.stackit.kube_config_raw).users[0].user.client-certificate-data)
    client_key             = base64decode(yamldecode(module.stackit.kube_config_raw).users[0].user.client-key-data)
  }
}