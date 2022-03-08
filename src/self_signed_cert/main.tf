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
    common_name  = "example.com"
    organization = "ACME Examples, Inc"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
