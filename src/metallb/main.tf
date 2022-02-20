locals {
  config_map_heredoc = (local.valid_config && var.config_map_data == null && !var.configure_kind ? <<-EOF
  %{if length(var.config_map_address_pools) > 0}address-pools:%{endif}
  %{for pool in var.config_map_address_pools}
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
  kind_config_map_data = var.config_map_data == null && var.configure_kind ? "" : <<-EOF
  address-pools:
  - name: default
    protocol: layer2
    addresses:
    - 172.21.255.200-172.21.255.250
  EOF

  computed_config_map_data = (var.config_map_data != null
    ? var.config_map_data
    : (var.configure_kind
      ? local.kind_config_map_data
      : local.config_map_heredoc
    )
  )
}

data "external" "local_exec" {
  count = var.configure_kind ? 1 : 0
  program = ["bash", "${path.module}/get_kind_ip_range.sh"]
  query = {
    name = "kind"
  }
}

resource "kubernetes_config_map" "metallb_config_map" {
  metadata {
    annotations = var.config_map_annotations
    labels = var.config_map_labels
    name      = var.config.name
    namespace = var.config.namespace
  }

  data {
    config = local.computed_config_map_data
  }
}

module "metallb" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease?ref=helmrelease/0.0.2"

  config = var.config
}
