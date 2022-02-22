locals {
  config_map_heredoc = (local.valid_config && var.config.config_map_data == null && !var.config.configure_kind ? <<-EOF
  %{if length(var.config.config_map_address_pools) > 0}address-pools:%{endif}
  %{for pool in var.config.config_map_address_pools}
  - name: ${pool.name}
    protocol: ${pool.protocol}
    addresses:
  %{for address in pool.addresses}
    - ${address}
  %{endfor}
  %{endfor}
  EOF
  : "")

  # https://kind.sigs.k8s.io/docs/user/loadbalancer/
  kind_config_map_data = var.config.config_map_data == null && var.config.configure_kind ? "" : <<-EOF
  address-pools:
  - name: default
    protocol: layer2
    addresses:
  %{for address in data.local_exec.result.ips_and_cidrs}
    - ${address.ips}/${address.cidr}
  %{endfor}
  EOF

  computed_config_map_data = (var.config.config_map_data != null
    ? var.config.config_map_data
    : (var.config.configure_kind
      ? local.kind_config_map_data
      : local.config_map_heredoc
    )
  )
}

data "external" "local_exec" {
  count   = var.config.configure_kind ? 1 : 0
  program = ["bash", "${path.module}/get_kind_ip_range.sh"]
  query = {
    name = "kind"
  }
}

resource "kubernetes_config_map" "metallb_config_map" {
  metadata {
    annotations = var.config.config_map_annotations
    labels      = var.config.config_map_labels
    name        = var.config.helm_release_config.name
    namespace   = var.config.helm_release_config.namespace
  }

  data {
    config = local.computed_config_map_data
  }
}

resource "random_id" "metallb_secret_key" {
  keepers = {
    helm_revision = module.metallb.release.metadata.revision
  }

  byte_length = 128
}

resource "kubernetes_secret" "metallb_secret" {
  metadata {
    annotations = var.config.config_map_annotations
    labels      = var.config.config_map_labels
    name        = "${var.config.helm_release_config.name}-memberlist"
    namespace   = var.config.helm_release_config.namespace
  }

  # terraform hide
  binary_data = random_id.metallb_secret_key.id
}

module "metallb" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease?ref=helmrelease/0.0.4"

  config = var.config.helm_release_config
}
