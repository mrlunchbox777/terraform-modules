########################################################
# vars match the order here - https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
########################################################

variable "name" {
  type    = string
  default = "pi-hole"
}

# chart is going to be per downstream
# repository is going to be per downstream
# repository_key_file is going to be per downstream
# repository_cert_file is going to be per downstream
# repository_ca_file is going to be per downstream
# repository_username is going to be per downstream
# repository_password is going to be per downstream
# devel is going to be per downstream
# version is going to be per downstream

variable "namespace" {
  type    = string
  default = "default"
}

# verify is going to be per downstream
# keyring is going to be per downstream

variable "timeout" {
  type    = number
  default = 300
}

variable "disable_webhooks" {
  type    = bool
  default = false
}

variable "reuse_values" {
  type    = bool
  default = false
}

variable "reset_values" {
  type    = bool
  default = false
}
variable "force_update" {
  type    = bool
  default = false
}

variable "recreate_pods" {
  type    = bool
  default = false
}

variable "cleanup_on_fail" {
  type    = bool
  default = false
}

variable "max_history" {
  type    = number
  default = 0
}

variable "atomic" {
  type    = bool
  default = true
}

variable "skip_crds" {
  type    = bool
  default = false
}

variable "render_subchart_notes" {
  type    = bool
  default = true
}

variable "disable_openapi_validation" {
  type    = bool
  default = false
}

variable "wait" {
  type    = bool
  default = true
}

variable "wait_for_jobs" {
  type    = bool
  default = false
}

variable "values" {
  type    = list(string)
  default = []
}

variable "set" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}

variable "set_sensitive" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}

variable "dependency_update" {
  type    = bool
  default = false
}

variable "replace" {
  type    = bool
  default = false
}

variable "description" {
  type    = string
}

variable "postrender" {
  type = list(object({
    binary_path = string
  }))
  default = []
}

variable "lint" {
  type    = bool
  default = true
}

variable "create_namespace" {
  type    = bool
  default = false
}
