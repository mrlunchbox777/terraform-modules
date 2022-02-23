########################################################
# configs to merge
########################################################

variable "base_config" {
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
    chart_version              = string
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
  description = "Pass an base_config to provide base values"
}

variable "override_config" {
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
    chart_version              = string
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
  description = "Pass an override_config to override base values"
}

########################################################
# vars match the order here - https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
########################################################

variable "name" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#name"
}

variable "chart" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#chart"
}

variable "repository" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository"
}

variable "repository_key_file" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository_key_file"
}

variable "repository_cert_file" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository_cert_file"
}

variable "repository_ca_file" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository_ca_file"
}

variable "repository_username" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository_username"
}

variable "repository_password" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#repository_password"
}

variable "devel" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#devel"
}

variable "chart_version" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#version"
}

variable "namespace" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#namespace"
}

variable "verify" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#verify"
}

variable "keyring" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#keyring"
}

variable "timeout" {
  type        = number
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#timeout"
}

variable "disable_webhooks" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#disable_webhooks"
}

variable "reuse_values" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#reuse_values"
}

variable "reset_values" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#reset_values"
}

variable "force_update" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#force_update"
}

variable "recreate_pods" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#recreate_pods"
}

variable "cleanup_on_fail" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#cleanup_on_fail"
}

variable "max_history" {
  type        = number
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#max_history"
}

variable "atomic" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#atomic"
}

variable "skip_crds" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#skip_crds"
}

variable "render_subchart_notes" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#render_subchart_notes"
}

variable "disable_openapi_validation" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#disable_openapi_validation"
}

variable "wait" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#wait"
}

variable "wait_for_jobs" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#wait_for_jobs"
}

variable "values" {
  type        = list(string)
  default     = []
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#values"
}

variable "set" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#set"
}

variable "set_sensitive" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#set_sensitive"
}

variable "dependency_update" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#dependency_update"
}

variable "replace" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#replace"
}

variable "description" {
  type        = string
  default     = "Configured using https://github.com/mrlunchbox777/terraform-modules/tree/main/src/helm_release/config"
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#description"
}

variable "postrender" {
  type = list(object({
    binary_path = string
  }))
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#postrender"
}

variable "lint" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#lint"
}

variable "create_namespace" {
  type        = bool
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#create_namespace"
}
