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
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1"
    }
  }
}
