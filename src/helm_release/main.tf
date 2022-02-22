resource "helm_release" "release" {
  name                       = var.config.name
  chart                      = var.config.chart
  repository                 = var.config.repository
  repository_key_file        = var.config.repository_key_file
  repository_cert_file       = var.config.repository_cert_file
  repository_ca_file         = var.config.repository_ca_file
  repository_username        = var.config.repository_username
  repository_password        = var.config.repository_password
  devel                      = var.config.devel
  version                    = var.config.version
  namespace                  = var.config.namespace
  verify                     = var.config.verify
  keyring                    = var.config.keyring
  timeout                    = var.config.timeout
  disable_webhooks           = var.config.disable_webhooks
  reuse_values               = var.config.reuse_values
  reset_values               = var.config.reset_values
  force_update               = var.config.force_update
  recreate_pods              = var.config.recreate_pods
  cleanup_on_fail            = var.config.cleanup_on_fail
  max_history                = var.config.max_history
  atomic                     = var.config.atomic
  skip_crds                  = var.config.skip_crds
  render_subchart_notes      = var.config.render_subchart_notes
  disable_openapi_validation = var.config.disable_openapi_validation
  wait                       = var.config.wait
  wait_for_jobs              = var.config.wait_for_jobs
  values                     = var.config.values
  dependency_update          = var.config.dependency_update
  replace                    = var.config.replace
  description                = var.config.description
  lint                       = var.config.lint
  create_namespace           = var.config.create_namespace

  dynamic "postrender" {
    for_each = var.config.postrender
    content {
      binary_path = postrender.value.binary_path
    }
  }

  dynamic "set" {
    for_each = var.config.set
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }

  dynamic "set_sensitive" {
    for_each = var.config.set_sensitive
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = set_sensitive.value.type
    }
  }
}
