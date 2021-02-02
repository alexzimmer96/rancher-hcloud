terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.11.0"
    }
  }
}

provider "rancher2" {
  api_url   = var.rancher_hostname != null ? "https://${var.rancher_hostname}" : "https://rancher.${var.lb_address}.nip.io"
  token_key = var.rancher_admin_token
  insecure  = true
}


locals {

  servers = {
    "cx" = [
      { "id" = "cx11", "name" = "1cpu_2gb_intel" },
      { "id" = "cx21", "name" = "2cpu_4gb_intel" },
      { "id" = "cx31", "name" = "2cpu_8gb_intel" },
      { "id" = "cx41", "name" = "4cpu_16gb_intel" },
      { "id" = "cx51", "name" = "8cpu_32gb_intel" }
    ],
    "cx-ceph" = [
      { "id" = "cx11-ceph", "name" = "1cpu_2gb_intel" },
      { "id" = "cx21-ceph", "name" = "2cpu_4gb_intel" },
      { "id" = "cx31-ceph", "name" = "2cpu_8gb_intel" },
      { "id" = "cx41-ceph", "name" = "4cpu_16gb_intel" },
      { "id" = "cx51-ceph", "name" = "8cpu_32gb_intel" },      
    ],
    "cpx" = [
      { "id" = "cpx11", "name" = "2cpu_2gb_amd" },
      { "id" = "cpx21", "name" = "3cpu_4gb_amd" },
      { "id" = "cpx31", "name" = "4cpu_8gb_amd" },
      { "id" = "cpx41", "name" = "8cpu_16gb_amd" },
      { "id" = "cpx51", "name" = "16cpu_32gb_amd" },      
    ],
    "ccx" = [
      { "id" = "ccx11", "name" = "2cpu_8gb_dedi_intel" },
      { "id" = "ccx21", "name" = "4cpu_16gb_dedi_intel" },
      { "id" = "ccx31", "name" = "8cpu_32gb_dedi_intel" },
      { "id" = "ccx41", "name" = "16cpu_64gb_dedi_intel" },
      { "id" = "ccx51", "name" = "32cpu_128gb_dedi_intel" },      
    ]
  }

  node_types = flatten([
    for zone in var.node_template_zones : [
      for type, def in local.servers :  [
        for d in def : {
          zone = zone
          server = type
          type  = d.id
          description  = d.name
        }
      ]
    ]
  ])
}

resource "rancher2_node_template" "hetzner_nodes" {
  for_each = {
    for node in local.node_types : "${node.zone}.${node.type}" => node
    if contains(var.node_template_types, node.server)
  }

  name        = "${each.value.zone}_${each.value.type}_${each.value.description}"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token       = var.hcloud_token
    image           = "ubuntu-20.04"
    server_type     = "cx31"
    server_location = "hel1"
    networks        = var.private_network_name
  }
}