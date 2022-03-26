variable "key_override_algorithm" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#key_algorithm"
}

variable "key_override_private_pem" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#private_key_pem"
}

variable "common_name" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "organization" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "organizational_unit" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "street_address" {
  type        = list(string)
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "locality" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "province" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "country" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "postal_code" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "serial_number" {
  type        = string
  default     = null
  nullable    = true
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#subject"
}

variable "dns_names" {
  type        = list(string)
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#dns_names"
}

variable "ip_addresses" {
  type        = list(string)
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#ip_addresses"
}

variable "uris" {
  type        = list(string)
  default     = []
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request#uris"
}

variable "private_key_algorithm" {
  type        = string
  default     = "ECDSA"
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key#algorithm"
}

variable "private_key_rsa_bits" {
  type        = number
  default     = 4096
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key#rsa_bits"
}

variable "private_key_ecdsa_curve" {
  type        = string
  default     = "P521"
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key#ecdsa_curve"
}

variable "private_key_rsa_bits" {
  type        = number
  default     = 4096
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key#rsa_bits"
}

variable "validity_period_hours" {
  type        = number
  default     = 2160
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#validity_period_hours or https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#validity_period_hours"
}

variable "allowed_uses" {
  type        = list(string)
  default     = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
        "client_auth"
      ]
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#allowed_uses or https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert#allowed_uses"
}

variable "early_renewal_hours" {
  type        = number
  default     = 1440
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#early_renewal_hours or https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert#early_renewal_hours"
}

variable "is_ca_certificate" {
  type        = bool
  default     = false
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#is_ca_certificate or https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert#is_ca_certificate"
}

variable "set_subject_key_id" {
  type        = bool
  default     = false
  description = "https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert#set_subject_key_id or https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert#set_subject_key_id"
}
