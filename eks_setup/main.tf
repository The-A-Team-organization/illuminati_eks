provider "aws" {
  region = "eu-central-1"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config" # Path to the kubeconfig file
  }
}


terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
