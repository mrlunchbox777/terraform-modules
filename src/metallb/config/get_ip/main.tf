locals {
  ip_cidrs = [for key, value in data.external.get_ip_range.result : "${key}"
}

data "external" "get_ip_range" {
  program = ["bash", "${path.module}/get_viable_network_ip_range.sh"]
  query = {
    name = var.network_name
  }
}
