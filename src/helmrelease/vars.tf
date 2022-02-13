variable "config" {
  type = object({
    name                       = string
    chart                      = string
    repository                 = string
    repository_key_file        = string
    repository_cert_file       = string
    repository_ca_file         = string
    repository_username        = string
    repository_password        = string
    devel                      = bool
    version                    = string
    namespace                  = string
    verify                     = bool
    keyring                    = string
    timeout                    = number
    disable_webhooks           = bool
    reuse_values               = bool
    reset_values               = bool
    force_update               = bool
    recreate_pods              = bool
    cleanup_on_fail            = bool
    max_history                = number
    atomic                     = bool
    skip_crds                  = bool
    render_subchart_notes      = bool
    disable_openapi_validation = bool
    wait                       = bool
    wait_for_jobs              = bool
    values                     = list(string)
    set = list(object({
      name  = string
      value = string
      type  = string
    }))
    set_sensitive = list(object({
      name  = string
      value = string
      type  = string
    }))
    dependency_update = bool
    replace           = bool
    description       = string
    postrender = list(object({
      binary_path = string
    }))
    lint             = bool
    create_namespace = bool
  })
  default     = null
  nullable    = true
  description = "Pass an map that matches a scaffold from https://github.com/mrlunchbox777/terraform-modules/tree/main/src/helmrelease/config"
}
