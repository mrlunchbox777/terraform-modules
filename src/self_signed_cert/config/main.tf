locals {
  config = {
    key_config = {
      algorithm = "ECDSA"
      rsa_bits  = 4096
      ecdsa_curve = "P521"
    }
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
