resource "random_id" "metallb_secret_key" {
  keepers = {
    override_status = var.config.memberlist_secret_override
  }

  byte_length = 128
}

resource "kubernetes_secret" "metallb_memberlist_secret" {
  metadata {
    annotations = var.config.config_map_annotations
    labels      = var.config.config_map_labels
    name        = "${var.config.helm_release_config.name}-memberlist"
    namespace   = var.config.helm_release_config.namespace
  }

  binary_data = (length(var.config.memberlist_secret_override) > 0
    ? var.config.memberlist_secret_override
    : random_id.metallb_secret_key.id
  )
}
