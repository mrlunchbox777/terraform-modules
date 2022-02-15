locals {
  valid_config = ((var.configure_kind
    || (var.config_map_data != null)
    || (length(var.config_map_peers) > 0)
    || (length(var.config_map_address_pools) > 0)
    ) ? true
    : file("[Error] this module needs to be provided config map data, set to configure for KinD, be provided peers, and/or be provided address pools")
  )
}