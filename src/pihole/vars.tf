variable "atomic" {
  type    = bool
  default = true
}

variable "create_namespace" {
  type    = bool
  default = false
}

variable "cleanup_on_fail" {
  type    = bool
  default = false
}

variable "dependency_update" {
  type    = bool
  default = false
}

variable "description" {
  type    = string
  default = "pihole pulled from - https://github.com/mrlunchbox777/terraform-modules/tree/main/src/pihole"
}

variable "disable_openapi_validation" {
  type    = bool
  default = false
}

variable "disable_webhook" {
  type    = bool
  default = false
}

variable "force_update" {
  type    = bool
  default = false
}

variable "lint" {
  type    = bool
  default = true
}

variable "max_history" {
  type    = number
  default = 0
}

variable "name" {
  type    = string
  default = "pi-hole"
}

variable "namespace" {
  type    = string
  default = "default"
}

variable "postrender" {
  type    = list(object({
    binary_path = string
  }))
  default = []
}

variable "recreate_pods" {
  type    = bool
  default = false
}

variable "render_subchart_notes" {
  type    = bool
  default = true
}

variable "replace" {
  type    = bool
  default = false
}

variable "reset_values" {
  type    = bool
  default = false
}

variable "reuse_values" {
  type    = bool
  default = false
}

variable "set" {
  type    = list(object({
    name = string
    value = string
    type = string
  }))
  default = []
}

variable "set_sensitive" {
  type    = list(object({
    name = string
    value = string
    type = string
  }))
  default = []
}

variable "skip_crds" {
  type    = bool
  default = false
}

variable "timeout" {
  type    = number
  default = 300
}

variable "values" {
  type    = list(string)
  default = []
}

variable "wait" {
  type    = bool
  default = true
}

variable "wait_for_jobs" {
  type    = bool
  default = false
}
