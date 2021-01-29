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

resource "rancher2_node_template" "hetzner_nbg1_cx11_1cpu_2gb_intel" {
  name        = "nbg1_cx11_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cpx11_2cpu_2gb_amd" {
  name        = "nbg1_cpx11_2cpu_2gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx11"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx21_2cpu_4gb_intel" {
  name        = "nbg1_cx21_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cpx21_3cpu_4gb_amd" {
  name        = "nbg1_cpx21_3cpu_4gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx21"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx31_2cpu_8gb_intel" {
  name        = "nbg1_cx31_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cpx31_4cpu_8gb_amd" {
  name        = "nbg1_cpx31_4cpu_8gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx31"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx41_4cpu_16gb_intel" {
  name        = "nbg1_cx41_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cpx41_8cpu_16gb_amd" {
  name        = "nbg1_cpx41_8cpu_16gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx41"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx51_8cpu_32gb_intel" {
  name        = "nbg1_cx51_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cpx51_16cpu_32gb_amd" {
  name        = "nbg1_cpx51_16cpu_32gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx51"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx11_ceph_1cpu_2gb_intel" {
  name        = "nbg1_cx11_ceph_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11-ceph"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx21_ceph_2cpu_4gb_intel" {
  name        = "nbg1_cx21_ceph_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21-ceph"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx31_ceph_2cpu_8gb_intel" {
  name        = "nbg1_cx31_ceph_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31-ceph"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx41_ceph_4cpu_16gb_intel" {
  name        = "nbg1_cx41_ceph_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41-ceph"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_cx51_ceph_8cpu_32gb_intel" {
  name        = "nbg1_cx51_ceph_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51-ceph"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_ccx11_2cpu_8gb_dedi_intel" {
  name        = "nbg1_ccx11_2cpu_8gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx11"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_ccx21_4cpu_16gb_dedi_intel" {
  name        = "nbg1_ccx21_4cpu_16gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx21"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_ccx31_8cpu_32gb_dedi_intel" {
  name        = "nbg1_ccx31_8cpu_32gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx31"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_ccx41_16cpu_64gb_dedi_intel" {
  name        = "nbg1_ccx41_16cpu_64gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx41"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_nbg1_ccx51_32cpu_128gb_dedi_intel" {
  name        = "nbg1_ccx51_32cpu_128gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx51"
    server_location      = "nbg1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx11_1cpu_2gb_intel" {
  name        = "fsn1_cx11_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cpx11_2cpu_2gb_amd" {
  name        = "fsn1_cpx11_2cpu_2gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx11"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx21_2cpu_4gb_intel" {
  name        = "fsn1_cx21_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cpx21_3cpu_4gb_amd" {
  name        = "fsn1_cpx21_3cpu_4gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx21"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx31_2cpu_8gb_intel" {
  name        = "fsn1_cx31_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cpx31_4cpu_8gb_amd" {
  name        = "fsn1_cpx31_4cpu_8gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx31"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx41_4cpu_16gb_intel" {
  name        = "fsn1_cx41_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cpx41_8cpu_16gb_amd" {
  name        = "fsn1_cpx41_8cpu_16gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx41"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx51_8cpu_32gb_intel" {
  name        = "fsn1_cx51_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cpx51_16cpu_32gb_amd" {
  name        = "fsn1_cpx51_16cpu_32gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx51"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx11_ceph_1cpu_2gb_intel" {
  name        = "fsn1_cx11_ceph_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11-ceph"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx21_ceph_2cpu_4gb_intel" {
  name        = "fsn1_cx21_ceph_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21-ceph"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx31_ceph_2cpu_8gb_intel" {
  name        = "fsn1_cx31_ceph_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31-ceph"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx41_ceph_4cpu_16gb_intel" {
  name        = "fsn1_cx41_ceph_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41-ceph"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_cx51_ceph_8cpu_32gb_intel" {
  name        = "fsn1_cx51_ceph_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51-ceph"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_ccx11_2cpu_8gb_dedi_intel" {
  name        = "fsn1_ccx11_2cpu_8gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx11"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_ccx21_4cpu_16gb_dedi_intel" {
  name        = "fsn1_ccx21_4cpu_16gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx21"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_ccx31_8cpu_32gb_dedi_intel" {
  name        = "fsn1_ccx31_8cpu_32gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx31"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_ccx41_16cpu_64gb_dedi_intel" {
  name        = "fsn1_ccx41_16cpu_64gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx41"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_fsn1_ccx51_32cpu_128gb_dedi_intel" {
  name        = "fsn1_ccx51_32cpu_128gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx51"
    server_location      = "fsn1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx11_1cpu_2gb_intel" {
  name        = "hel1_cx11_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cpx11_2cpu_2gb_amd" {
  name        = "hel1_cpx11_2cpu_2gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx11"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx21_2cpu_4gb_intel" {
  name        = "hel1_cx21_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cpx21_3cpu_4gb_amd" {
  name        = "hel1_cpx21_3cpu_4gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx21"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx31_2cpu_8gb_intel" {
  name        = "hel1_cx31_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cpx31_4cpu_8gb_amd" {
  name        = "hel1_cpx31_4cpu_8gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx31"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx41_4cpu_16gb_intel" {
  name        = "hel1_cx41_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cpx41_8cpu_16gb_amd" {
  name        = "hel1_cpx41_8cpu_16gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx41"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx51_8cpu_32gb_intel" {
  name        = "hel1_cx51_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cpx51_16cpu_32gb_amd" {
  name        = "hel1_cpx51_16cpu_32gb_amd"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cpx51"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx11_ceph_1cpu_2gb_intel" {
  name        = "hel1_cx11_ceph_1cpu_2gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx11-ceph"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx21_ceph_2cpu_4gb_intel" {
  name        = "hel1_cx21_ceph_2cpu_4gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx21-ceph"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx31_ceph_2cpu_8gb_intel" {
  name        = "hel1_cx31_ceph_2cpu_8gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx31-ceph"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx41_ceph_4cpu_16gb_intel" {
  name        = "hel1_cx41_ceph_4cpu_16gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx41-ceph"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_cx51_ceph_8cpu_32gb_intel" {
  name        = "hel1_cx51_ceph_8cpu_32gb_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "cx51-ceph"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_ccx11_2cpu_8gb_dedi_intel" {
  name        = "hel1_ccx11_2cpu_8gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx11"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_ccx21_4cpu_16gb_dedi_intel" {
  name        = "hel1_ccx21_4cpu_16gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx21"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_ccx31_8cpu_32gb_dedi_intel" {
  name        = "hel1_ccx31_8cpu_32gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx31"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_ccx41_16cpu_64gb_dedi_intel" {
  name        = "hel1_ccx41_16cpu_64gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx41"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}

resource "rancher2_node_template" "hetzner_hel1_ccx51_32cpu_128gb_dedi_intel" {
  name        = "hel1_ccx51_32cpu_128gb_dedi_intel"
  driver_id   = var.hetzner_driver_id
  hetzner_config {
    api_token            = var.hcloud_token
    image                = "ubuntu-20.04"
    server_type          = "ccx51"
    server_location      = "hel1"
    networks             = var.private_network_name
    use_private_networks = var.use_private_networks
    userdata             = var.userdata
  }
}



