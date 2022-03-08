locals {
  should_use_key_override = (length(var.config.key_override.key_algorithm) > 0
    && length(var.config.key_override.private_key_pem) > 0)
  key_algorithm = (local.should_use_key_override ? var.config.key_override.key_algorithm
    : tls_private_key.private_key[0].key_algorithm)
  private_key_pem = (local.should_use_key_override ? var.config.key_override.private_key_pem
    : tls_private_key.private_key[0].private_key_pem)

  config = {
    # key_config = {
    #   algorithm = "ECDSA"
    #   rsa_bits  = 4096
    #   ecdsa_curve = "P521"
    # }
    key_override = {
      key_algorithm = ""
      private_key_pem = ""
    }
    self_signed_cert_config = {
      cert_request = {
        subject = {
          common_name = ""
          organization = ""
          organizational_unit = ""
          street_address = [""]
          locality = ""
          province = ""
          country = ""
          postal_code = ""
          serial_number = ""
        }
        dns_names = [""]
        ip_addresses = [""]
        uris = [""]
      }
      validity_period_hours = 2160
      allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
        "client_auth"
      ]
      early_renewal_hours = 1440
      is_ca_certificate = false
      set_subject_key_id = false
    }
  }
}

resource "tls_private_key" "private_key" {
  count = local.should_use_key_override ? 0 : 1

  algorithm = var.config.key_config.algorithm
  rsa_bits  = var.config.key_config.rsa_bits
  ecdsa_curve = var.config.key_config.ecdsa_curve
}

resource "tls_cert_request" "cert_request" {
  key_algorithm   = local.algorithm
  private_key_pem = local.private_key_pem

  subject {
    common_name = var.config.self_signed_cert_config.cert_request.subject.common_name
    organization = var.config.self_signed_cert_config.cert_request.subject.organization
    organizational_unit = var.config.self_signed_cert_config.cert_request.subject.organizational_unit
    street_address = var.config.self_signed_cert_config.cert_request.subject.street_address
    locality = var.config.self_signed_cert_config.cert_request.subject.locality
    province = var.config.self_signed_cert_config.cert_request.subject.province
    country = var.config.self_signed_cert_config.cert_request.subject.country
    postal_code = var.config.self_signed_cert_config.cert_request.subject.postal_code
    serial_number = var.config.self_signed_cert_config.cert_request.subject.serial_number
  }

  dns_names = var.config.self_signed_cert_config.cert_request.dns_names
  ip_addresses = var.config.self_signed_cert_config.cert_request.ip_addresses
  uris = var.config.self_signed_cert_config.cert_request.uris
}
