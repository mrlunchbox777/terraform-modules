locals {
  ip_cidrs = [for address in data.external.get_ip_range.result.ips_and_cidrs :
    "${address.ips}/${address.cidr}"
  ]
}

data "external" "get_ip_range" {
  program = ["bash", "${path.module}/get_viable_network_ip_range.sh"]
  query = {
    name = var.network_name
  }
}
