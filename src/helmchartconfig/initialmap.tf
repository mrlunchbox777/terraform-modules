locals {
  helmchartinitial = {
    name                       = null
    chart                      = null
    repository                 = null
    repository_key_file        = null
    repository_cert_file       = null
    repository_ca_file         = null
    repository_username        = null
    repository_password        = null
    devel                      = null
    version                    = null
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
    values                     = null
    set                        = null
    set_sensitive              = null
    dependency_update          = null
    replace                    = null
    description                = null
    postrender                 = null
    lint                       = null
    create_namespace           = null
  }

	basemap = (var.base_config != null
		? var.base_config
		: {}
	)

	overridemap = (var.override_config != null
		? var.override_config
		: {}
	)

	helmchartconfigoverlay = merge(local.helmchartinitial, basemap, overridemap)
}