output "self_signed_cert" {
	value = tls_self_signed_cert.self_signed_cert
	description = "The generated tls_self_signed_cert"
}
