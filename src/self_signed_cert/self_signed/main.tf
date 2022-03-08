locals {
  should_use_key_override = (length(var.config.key_override.key_algorithm) > 0
    && length(var.config.key_override.private_key_pem) > 0)
  key_algorithm = (local.should_use_key_override ? var.config.key_override.key_algorithm
    : tls_private_key.private_key[0].key_algorithm)
  private_key_pem = (local.should_use_key_override ? var.config.key_override.private_key_pem
    : tls_private_key.private_key[0].private_key_pem)
}

resource "tls_private_key" "private_key" {
  count = local.should_use_key_override ? 0 : 1

  algorithm = var.config.key_config.algorithm
  rsa_bits  = var.config.key_config.rsa_bits
  ecdsa_curve = var.config.key_config.ecdsa_curve
}

resource "tls_self_signed_cert" "self_signed_cert" {
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

  validity_period_hours = var.config.self_signed_cert_config.validity_period_hours
  allowed_uses = var.config.self_signed_cert_config.allowed_uses
  dns_names = var.config.self_signed_cert_config.cert_request.dns_names
  ip_addresses = var.config.self_signed_cert_config.cert_request.ip_addresses
  uris = var.config.self_signed_cert_config.cert_request.uris
  early_renewal_hours = var.config.self_signed_cert_config.early_renewal_hours
  is_ca_certificate = var.config.self_signed_cert_config.is_ca_certificate
  set_subject_key_id = var.config.self_signed_cert_config.set_subject_key_id
}
