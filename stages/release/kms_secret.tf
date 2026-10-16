resource "kubernetes_namespace" "servers" {
  metadata {
    name = "servers"
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
      "environment"                  = "release"
    }
  }

  depends_on = [module.stackit]
}

resource "kubernetes_secret" "velocity_kms" {
  metadata {
    name      = "velocity-kms-secret"
    namespace = "servers"
    labels = {
      "app.kubernetes.io/name"       = "velocity-forward-proxy"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  data = {
    STACKIT_PROJECT_ID = var.stackit_project_id
    STACKIT_KEYRING_ID = module.stackit.kms_keyring_id          # or stackit_kms_keyring.keyring_minecraft.keyring_id if in root
    STACKIT_KEY_ID     = module.stackit.kms_forward_proxy_key_id # or stackit_kms_key.forward_proxy.key_id if in root
    STACKIT_REGION     = "eu01"

    # Service Account key needed by pods to authenticate with STACKIT KMS APIs
    SERVICE_ACCOUNT_KEY = file(var.stackit_service_account_key_path)
  }

  type = "Opaque"

  depends_on = [module.stackit]
}