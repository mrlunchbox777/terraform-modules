output "config" {
	value = local.config
	description = "The config used for other cert building activites"
	sensitive = true
}

output "cert_request" {
	value = tls_cert_request.cert_request
	description = "The certificate request that was created as part of the config"
}

output "private_key" {
	value = local.should_use_key_override ? null : tls_private_key.private_key[0]
	description = "The generated tls_private_key, if generated"
}

output "used_key_override" {
	value = local.should_use_key_override
	description = "If an override was used (false if a key was generated)"
}
