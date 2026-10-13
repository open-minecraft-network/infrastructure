# 1. Install Argo CD
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  depends_on = [
    module.stackit
  ]
}

resource "helm_release" "argocd_apps" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  namespace  = helm_release.argocd.namespace

  depends_on = [
    helm_release.argocd
  ]

  values = [
    yamlencode({
      applications = {
        argocd-manifest = {
          namespace = helm_release.argocd.namespace
          project   = "default"
          source = {
            repoURL        = "https://github.com/open-minecraft-network/config.git"
            targetRevision = "main"
            path           = "live/release"
          }
          destination = {
            server    = "https://kubernetes.default.svc"
            namespace = "argocd"
          }
          syncPolicy = {
            automated = {
              prune    = true
              selfHeal = true
            }
            syncOptions = ["CreateNamespace=true"]
          }
        }
      }
    })
  ]
}