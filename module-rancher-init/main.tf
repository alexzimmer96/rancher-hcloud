terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "1.3.2"
    }
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.11.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

provider "rancher2" {
  alias     = "bootstrap"
  api_url   = var.rancher_hostname != null ? "https://${var.rancher_hostname}" : "https://rancher.${var.lb_address}.nip.io"
  bootstrap = true
  insecure  = true
}

provider "rancher2" {
  alias     = "admin"
  api_url   = var.rancher_hostname != null ? "https://${var.rancher_hostname}" : "https://rancher.${var.lb_address}.nip.io"
  token_key = rancher2_bootstrap.setup_admin.token
  insecure  = true
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

resource "rancher2_bootstrap" "setup_admin" {
  provider   = rancher2.bootstrap
  password   = var.rancher_admin_password
  telemetry  = true
  depends_on = [helm_release.rancher]
}

resource "rancher2_node_driver" "hetzner_node_driver" {
  provider = rancher2.admin
  active   = true
  builtin  = false
  name     = "Hetzner"
  ui_url   = "https://storage.googleapis.com/hcloud-rancher-v2-ui-driver/component.js"
  url      = "https://github.com/JonasProgrammer/docker-machine-driver-hetzner/releases/download/3.2.0/docker-machine-driver-hetzner_3.2.0_linux_amd64.tar.gz"
  whitelist_domains = ["storage.googleapis.com"]
}

output "rancher_admin_token" {
  value = rancher2_bootstrap.setup_admin.token
}

output "hetzner_driver_id" {
  value = rancher2_node_driver.hetzner_node_driver.id
}