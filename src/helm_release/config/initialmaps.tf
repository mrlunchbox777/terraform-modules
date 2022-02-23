locals {
  basemap = (var.base_config != null
    ? var.base_config
    : local.initialmap
  )

  initialmap = {
    name                       = null
    chart                      = null
    repository                 = null
    repository_key_file        = null
    repository_cert_file       = null
    repository_ca_file         = null
    repository_username        = null
    repository_password        = null
    devel                      = null
    chart_version              = null
    namespace                  = null
    verify                     = null
    keyring                    = null
    timeout                    = null
    disable_webhooks           = null
    reuse_values               = null
    reset_values               = null
    force_update               = null
    recreate_pods              = null
    cleanup_on_fail            = null
    max_history                = null
    atomic                     = null
    skip_crds                  = null
    render_subchart_notes      = null
    disable_openapi_validation = null
    wait                       = null
    wait_for_jobs              = null
    values                     = []
    set                        = []
    set_sensitive              = []
    dependency_update          = null
    replace                    = null
    description                = null
    postrender                 = []
    lint                       = null
    create_namespace           = null
  }

  overridemap = (var.override_config != null
    ? var.override_config
    : local.initialmap
  )

  parametersmap = {
    name                       = var.name
    chart                      = var.chart
    repository                 = var.repository
    repository_key_file        = var.repository_key_file
    repository_cert_file       = var.repository_cert_file
    repository_ca_file         = var.repository_ca_file
    repository_username        = var.repository_username
    repository_password        = var.repository_password
    devel                      = var.devel
    chart_version              = var.chart_version
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
}
