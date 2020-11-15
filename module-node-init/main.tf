terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.10.7" # Need to change this version after feature gets released
    }
  }
}

provider "rancher2" {
  api_url   = var.rancher_hostname != null ? "https://${var.rancher_hostname}" : "https://rancher.${var.lb_address}.nip.io"
  token_key = var.rancher_admin_token
  insecure  = true
}

resource "rancher2_node_template" "hetzner_create_template" {
  name        = "hetzner-default"
  description = "Default template to acquire Hetzner Cloud Nodes"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token       = var.hcloud_token
    image           = "ubuntu-20.04"
    server_type     = "cx31"
    server_location = "hel1"
    networks        = "kubernetes-internal"
  }
}