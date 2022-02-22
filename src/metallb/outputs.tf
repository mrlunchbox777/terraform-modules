output "release" {
  value       = module.metallb.release
  description = "metallb release"
}

output "configmap" {
  value       = kubernetes_config_map.metallb_config_map
  description = "configmap for metallb"
}

output "memberlist_secret" {
  value       = kubernetes_secret.metallb_memberlist_secret
  description = "the memberlist secret"
}
