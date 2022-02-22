variable "network_name" {
  type        = string
  default     = "kind"
  nullable    = true
  description = "The name of the docker network to get a range from"
}
