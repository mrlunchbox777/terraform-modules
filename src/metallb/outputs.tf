output "release" {
  value       = module.metallb.release
  description = "metallb release"
}

output "configmap" {
  value       = kubernetes_config_map.metallb_config_map
  description = "configmap for metallb"
}
