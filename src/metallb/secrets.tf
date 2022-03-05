locals {
  key_override = (var.config.memberlist_secret_override != null
    ? var.config.memberlist_secret_override
    : ""
  )

  final_key = (length(local.key_override) > 0
    ? local.key_override
    : random_id.metallb_secret_key.b64_std
  )

  final_key_map = {
    secretkey = local.final_key
  }
}

# what this needs to do - https://www.misterpki.com/openssl-rand/
# provider docs - https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id
# a null resource might do this as well
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

  binary_data = local.final_key_map
}
