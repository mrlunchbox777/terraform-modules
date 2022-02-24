locals {
  valid_config = (((var.config.config_map_data != null)
    || (length(var.config.config_map_data_peers) > 0)
    || (length(var.config.config_map_data_address_pools) > 0)
    ) ? true
    : file("[Error] this module needs to be provided config map data, be provided peers, and/or be provided address pools")
  )
}