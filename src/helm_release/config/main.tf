locals {
  collection_props = [
    "values",
    "set",
    "set_sensitive",
    "postrender"
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

  not_real_config = {
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
