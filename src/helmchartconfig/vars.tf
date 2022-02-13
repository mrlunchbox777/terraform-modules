########################################################
# configs to merge
########################################################

variable "base_config" {
	type = object({
		name = string
		chart = string
		repository = string
		repository_key_file = string
		repository_cert_file = string
		repository_ca_file = string
		repository_username = string
		repository_password = string
		devel = bool
		version = string
		namespace = string
		verify = bool
		keyring = string
		timeout = number
		disable_webhooks = bool
		reuse_values = bool
		reset_values = bool
		force_update = bool
		recreate_pods = bool
		cleanup_on_fail = bool
		max_history = number
		atomic = bool
		skip_crds = bool
		render_subchart_notes = bool
		disable_openapi_validation = bool
		wait = bool
		wait_for_jobs = bool
		values = list(string)
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
		replace = bool
		description = string
		postrender = list(object({
			binary_path = string
		}))
		lint = bool
		create_namespace = bool
	})
	default = {}
	description = "Pass 0-1 base_configs"
}

variable "override_config" {
	type = object({
		name = string
		chart = string
		repository = string
		repository_key_file = string
		repository_cert_file = string
		repository_ca_file = string
		repository_username = string
		repository_password = string
		devel = bool
		version = string
		namespace = string
		verify = bool
		keyring = string
		timeout = number
		disable_webhooks = bool
		reuse_values = bool
		reset_values = bool
		force_update = bool
		recreate_pods = bool
		cleanup_on_fail = bool
		max_history = number
		atomic = bool
		skip_crds = bool
		render_subchart_notes = bool
		disable_openapi_validation = bool
		wait = bool
		wait_for_jobs = bool
		values = list(string)
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
		replace = bool
		description = string
		postrender = list(object({
			binary_path = string
		}))
		lint = bool
		create_namespace = bool
	})
	default = {}
	description = "Pass 0-1 override_configs"
}

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
	default = "Configured using https://github.com/mrlunchbox777/terraform-modules/tree/main/src/helmchartconfig"
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
