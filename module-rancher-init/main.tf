terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "1.3.2"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "1.0.4"

  wait             = true
  create_namespace = true
  force_update     = true
  replace          = true

  set {
    name  = "installCRDs"
    value = true
  }
}

resource "helm_release" "rancher" {
  name = "rancher"
  namespace = "cattle-system"
  chart = "rancher"
  repository = "https://releases.rancher.com/server-charts/latest"
  depends_on = [helm_release.cert_manager]

  wait             = true
  create_namespace = true
  force_update     = true
  replace          = true

  set {
    name  = "hostname"
    value = var.rancher_hostname != null ? var.rancher_hostname : "rancher.${var.lb_address}.nip.io"
  }

  set {
    name  = "ingress.tls.source"
    value = "letsEncrypt"
  }

  set {
    name  = "letsEncrypt.email"
    value = var.letsencrypt_issuer
  }
}