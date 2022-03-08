variable "base_config" {
  type = object({
    key_override = object({
      key_algorithm = string
      private_key_pem = string
    })
    self_signed_cert_config = object({
      cert_request = object({
        subject = object({
          common_name = string
          organization = string
          organizational_unit = string
          street_address = list(string)
          locality = string
          province = string
          country = string
          postal_code = string
          serial_number = string
        })
        dns_names = list(string)
        ip_addresses = list(string)
        uris = list(string)
      })
      validity_period_hours = number
      allowed_uses = list(string)
      early_renewal_hours = number
      is_ca_certificate = bool
      set_subject_key_id = bool
    })
  })
  description = "Pass an map that matches a scaffold from https://github.com/mrlunchbox777/terraform-modules/tree/main/src/self_signed_cert/config"
	default = null
	nullable = true
}
