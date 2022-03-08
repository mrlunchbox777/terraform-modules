output "private_key" {
	value = local.should_use_key_override ? null : tls_private_key.private_key[0]
	description = "The generated tls_private_key, if generated"
}

output "self_signed_cert" {
	value = tls_self_signed_cert.self_signed_cert
	description = "The generated tls_self_signed_cert"
}
