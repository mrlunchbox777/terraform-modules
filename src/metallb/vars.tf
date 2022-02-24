variable "config" {
  type = object({
    config_map_data_address_pools = list(object({
      name      = string
      protocol  = string
      addresses = list(string)
    }))
    config_map_annotations = map(string)
    config_map_data        = string
    config_map_data_peers = list(object({
      peer_address = string
      peer_asn     = number
      my_asn       = number
    }))
    config_map_labels = map(string)
    helm_release_config = object({
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
    memberlist_secret_override = string
  })
  description = "Pass an map that matches a scaffold from https://github.com/mrlunchbox777/terraform-modules/tree/main/src/metallb/config"
}
