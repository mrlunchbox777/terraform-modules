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
    }
  }
}
