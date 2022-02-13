resource "helm_release" "release" {
  name       = var.config.name
  chart      = var.config.chart
  repository = var.config.repository
  repository_key_file = var.config.repository_key_file
  repository_cert_file = var.config.repository_cert_file
  repository_ca_file = var.config.repository_ca_file
  repository_username = var.config.repository_username
  repository_password = var.config.repository_password
  devel = var.config.devel
  version = var.config.version
  namespace  = var.config.namespace
  verify  = var.config.verify
  keyring  = var.config.keyring
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
  dependency_update          = var.dependency_update
  replace                    = var.replace
  description                = var.description
  lint                       = var.lint
  create_namespace           = var.create_namespace

  dynamic "postrender" {
    for_each = var.postrender
    content {
      binary_path = postrender.value.binary_path
    }
  }

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = set_sensitive.value.type
    }
  }
}
