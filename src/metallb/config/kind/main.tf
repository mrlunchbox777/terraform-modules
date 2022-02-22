locals {
  kind_address_pools = [
    {
      name      = "default"
      protocol  = "layer2"
      addresses = module.get_ip.ip_cidrs
    }
  ]
}

module "get_ip" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config/get_ip?ref=metallb/config/get_ip/0.0.1"
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config/get_ip?ref=bug/fixing-errors"
}

module "config" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config?ref=metallb/config/0.0.1"
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config?ref=bug/fixing-errors"

  override_config               = var.override_config
  config_map_annotations        = var.config_map_annotations
  config_map_labels             = var.config_map_labels
  memberlist_secret_override    = var.memberlist_secret_override
  network_name                  = var.network_name
  config_map_data_address_pools = local.kind_address_pools
}
