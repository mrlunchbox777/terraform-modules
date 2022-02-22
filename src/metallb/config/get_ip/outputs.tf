output "get_ip_range_output" {
  value       = external.get_ip_range
  description = "Raw external output"
}

output "ip_cidrs" {
  value       = local.ip_cidrs
  description = "A list ip cidrs that can be used"
}
