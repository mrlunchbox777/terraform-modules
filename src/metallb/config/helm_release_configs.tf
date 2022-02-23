module "base_config" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config/base?ref=helm_release/config/base/0.0.2"
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config/base?ref=bug/fixing-errors"

  name      = local.name
  namespace = local.namespace
  chart     = local.chart
}

module "config" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config/base?ref=helm_release/config/0.0.2"
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config/base?ref=bug/fixing-errors"

  base_config     = module.base_config.config
  override_config = var.override_config
}
