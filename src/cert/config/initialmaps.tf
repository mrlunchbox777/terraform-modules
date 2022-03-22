locals {
  basemap = (var.base_config != null
    ? var.base_config
    : local.initialmap
  )

  initialmap = {
    key_override = {
      key_algorithm = null
      private_key_pem = null
    }
    self_signed_cert_config = {
      cert_request = {
        subject = {
          common_name = null
          organization = null
          organizational_unit = null
          street_address = []
          locality = null
          province = null
          country = null
          postal_code = null
          serial_number = null
        }
        dns_names = []
        ip_addresses = []
        uris = []
      }
      validity_period_hours = null
      allowed_uses = []
      early_renewal_hours = null
      is_ca_certificate = null
      set_subject_key_id = null
    }
  }

  overridemap = (var.override_config != null
    ? var.override_config
    : local.initialmap
  )

  parametersmap = {
    key_override = {
      key_algorithm = var.key_override_algorithm
      private_key_pem = var.private_key_pem
    }
    self_signed_cert_config = {
      cert_request = {
        subject = {
          common_name = var.common_name
          organization = var.organization
          organizational_unit = var.organizational_unit
          street_address = var.street_address
          locality = var.locality
          province = var.province
          country = var.country
          postal_code = var.postal_code
          serial_number = var.serial_number
        }
        dns_names = var.dns_names
        ip_addresses = var.ip_addresses
        uris = var.uris
      }
      validity_period_hours = var.validity_period_hours
      allowed_uses = var.allowed_uses
      early_renewal_hours = var.early_renewal_hours
      is_ca_certificate = var.is_ca_certificate
      set_subject_key_id = var.set_subject_key_id
    }
  }
}
