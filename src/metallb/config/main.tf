locals {
  name      = "metallb"
  namespace = "metallb"
  chart     = "${path.module}/charts/metallb"

  config = {
    helm_release_config = module.config.config
		config_map_data_address_pools = var.config_map_data_address_pools
		config_map_annotations = var.config_map_annotations
		config_map_data = var.config_map_data
		config_map_data_peers = var.config_map_data_peers
		config_map_labels = var.config_map_labels
		configure_kind = var.configure_kind
		configure_kind_force_update = var.configure_kind_force_update
  }
}
