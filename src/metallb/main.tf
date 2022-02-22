locals {
  config_map_heredoc = (local.valid_config && var.config.config_map_data == null ? <<-EOF
  %{if length(var.config.config_map_address_pools) > 0}address-pools:%{endif}
  %{for pool in var.config.config_map_address_pools}
  - name: ${pool.name}
    protocol: ${pool.protocol}
    addresses:
  %{for address in pool.addresses}
    - ${address}
  %{endfor}
  %{endfor}
  %{if length(var.config.config_map_data_peers) > 0}peers:%{endif}
  %{for peer in var.config.config_map_data_peers}
  - peer-address: ${peer.peer_address}
    peer-asn: ${peer.peer_asn}
    my-asn: ${peer.my_asn}
  %{endfor}
  EOF
  : "")

  computed_config_map_data = (var.config.config_map_data != null
    ? var.config.config_map_data
    : local.config_map_heredoc
  )
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

module "metallb" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release?ref=helm_release/0.0.4"

  config = var.config.helm_release_config
}
