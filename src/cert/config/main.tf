locals {
  should_use_key_override = (length(var.config.key_override.key_algorithm) > 0
    && length(var.config.key_override.private_key_pem) > 0)
  key_algorithm = (local.should_use_key_override ? var.config.key_override.key_algorithm
    : tls_private_key.private_key[0].key_algorithm)
  private_key_pem = (local.should_use_key_override ? var.config.key_override.private_key_pem
    : tls_private_key.private_key[0].private_key_pem)

  collection_props = [
    "street_address",
    "dns_names",
    "ip_addresses",
    "uris",
    "allowed_uses"
  ]

  map_props = [
    "cert_request",
    "subject"
  ]

  config_for_lists = { for k in local.collection_props :
    k => concat(
      try(coalescelist(local.initialmap[k], []), []),
      try(coalescelist(local.basemap[k], []), []),
      try(coalescelist(local.overridemap[k], []), []),
      try(coalescelist(local.parametersmap[k], []), [])
    )
  }

  config_temp = { for k, v in local.initialmap :
    k => contains(local.collection_props, k)
    ? lookup(local.initialmap, k, null)
    : (lookup(local.parametersmap, k, null) != null
      ? lookup(local.parametersmap, k, null)
      : (lookup(local.overridemap, k, null) != null
        ? lookup(local.overridemap, k, null)
        : (lookup(local.basemap, k, null) != null
          ? lookup(local.basemap, k, null)
          : lookup(local.initialmap, k, null)
        )
      )
    )
  }

  config = merge(local.config_temp, local.config_for_lists)
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
