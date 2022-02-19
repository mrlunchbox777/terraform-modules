terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7"
    }
    // this needs to be moved to a testing only extension
    external = {
      source  = "hashicorp/external"
      version = ">= 2.2"
    }
  }
}
