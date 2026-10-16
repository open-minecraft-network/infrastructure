resource "stackit_kms_keyring" "keyring_minecraft" {
  project_id   = var.stackit_project_id # or var.project_id if inside modules/stackit
  display_name = "keyring_minecraft"
  description  = "A keyring that has the keys for Minecraft like Velocity Forward Proxy"
}

resource "stackit_kms_key" "forward_proxy" {
  project_id   = var.stackit_project_id
  keyring_id   = stackit_kms_keyring.keyring_minecraft.keyring_id # Dynamic reference
  display_name = "forward-proxy-01"
  protection   = "software"
  algorithm    = "aes_256_gcm"
  purpose      = "symmetric_encrypt_decrypt"
}