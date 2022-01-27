locals {}

resource "helm_release" "pihole" {
  name      = var.name
  namespace = var.namespace

  atomic                     = var.atomic
  chart                      = "./charts/pihole-2.4.0"
  cleanup_on_fail            = var.cleanup_on_fail
  create_namespace           = var.create_namespace
  dependency_update          = var.dependency_update
  description                = var.description
  disable_openapi_validation = var.disable_openapi_validation
  disable_webhooks           = var.disable_webhooks
  force_update               = var.force_update
  lint                       = var.lint
  max_history                = var.max_history
  recreate_pods              = var.recreate_pods
  render_subchart_notes      = var.render_subchart_notes
  replace                    = var.replace
  reuse_values               = var.reuse_values
  reset_values               = var.reset_values
  skip_crds                  = var.skip_crds
  timeout                    = var.timeout
  version                    = var.version
  values                     = var.values
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs

  dynamic "postrender" {
    for_each = var.postrender

    binary_path = postrender.value.binary_path
  }

  dynamic "set" {
    for_each = var.set

    name = set.value.name
    value = set.value.value
    type = set.value.type
  }

  dynamic "set_sensitive" {
    for_each = var.set

    name = set.value.name
    value = set.value.value
    type = set.value.type
  }
}
