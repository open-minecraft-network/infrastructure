module "argocd" {
  source = "../../modules/platform/argocd"

  namespace = "argocd"

  custom_values = {
    server = {
      service = {
        type = "LoadBalancer"
      }
    }
  }

  depends_on = [module.stackit]
}

resource "helm_release" "argocd_root_app" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "2.0.2"
  namespace  = "argocd"

  values = [
    yamlencode({
      applications = {
        network-config = {
          namespace = "argocd"
          project   = "default"
          source = {
            repoURL        = "https://github.com/open-minecraft-network/config"
            path           = "live/release"
            targetRevision = "HEAD"
            directory = {
              recurse = true
              jsonnet = {}
            }
          }
          destination = {
            server    = "https://kubernetes.default.svc"
            namespace = "servers"
          }
          syncPolicy = {
            automated = {
              prune    = true
              selfHeal = true
            }
            syncOptions = [
              "CreateNamespace=true"
            ]
            retry = {
              limit = 2
              backoff = {
                duration    = "5s"
                factor      = 2
                maxDuration = "3m0s"
              }
            }
          }
        }
      }
    })
  ]

  depends_on = [module.argocd]
}