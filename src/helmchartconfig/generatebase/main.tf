module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmchartconfig?ref=helmchartconfig/1.0.0"

  name                       = var.name
  chart                      = var.chart
  repository                 = var.repository
  repository_key_file        = var.repository_key_file
  repository_cert_file       = var.repository_cert_file
  repository_ca_file         = var.repository_ca_file
  repository_username        = var.repository_username
  repository_password        = var.repository_password
  devel                      = var.devel
  version                    = var.version
  namespace                  = var.namespace
  verify                     = var.verify
  keyring                    = var.keyring
  timeout                    = var.timeout
  disable_webhooks           = var.disable_webhooks
  reuse_values               = var.reuse_values
  reset_values               = var.reset_values
  force_update               = var.force_update
  recreate_pods              = var.recreate_pods
  cleanup_on_fail            = var.cleanup_on_fail
  max_history                = var.max_history
  atomic                     = var.atomic
  skip_crds                  = var.skip_crds
  render_subchart_notes      = var.render_subchart_notes
  disable_openapi_validation = var.disable_openapi_validation
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs
  values                     = var.values
  set                        = var.set
  set_sensitive              = var.set_sensitive
  dependency_update          = var.dependency_update
  replace                    = var.replace
  description                = var.description
  postrender                 = var.postrender
  lint                       = var.lint
  create_namespace           = var.create_namespace
}