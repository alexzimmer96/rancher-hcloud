provider "hcloud" {
  token = var.hcloud_token
}

#======================================================================================================
# Creating Networks and Nodes

resource "hcloud_network" "kubernetes_internal_network" {
  name     = var.private_network_name
  ip_range = "172.16.0.0/12"

  labels = {
    automated = true
  }
}

resource "hcloud_ssh_key" "rancher_management_ssh_key" {
  name       = "rancher-management-key"
  public_key = file("${var.hcloud_ssh_key_path}.pub")
  labels = {
    automated = true
  }
}

resource "hcloud_server" "rancher_management_nodes" {
  count       = var.instance_count
  name        = "${var.instance_prefix}-${count.index + 1}"
  image       = "ubuntu-20.04"
  server_type = var.instance_type

  location    = element(var.instance_zones, count.index) # Modulo is performed by element function
  user_data   = file("${path.module}/scripts/rancher_management_init.sh")

  # This is necessary to wait for all installation tasks to finish
  provisioner "remote-exec" {
    inline = ["cloud-init status --wait > /dev/null"]
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.hcloud_ssh_key_path)
      host        = self.ipv4_address
    }
  }

  ssh_keys = [
    hcloud_ssh_key.rancher_management_ssh_key.id
  ]

  labels = {
    automated = true
  }
}

resource "hcloud_network_subnet" "rancher_management_subnet" {
  network_id   = hcloud_network.kubernetes_internal_network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "172.16.1.0/24"
}

resource "hcloud_server_network" "rancher_node_subnet_registration" {
  count      = var.instance_count
  server_id  = hcloud_server.rancher_management_nodes[count.index].id
  subnet_id  = hcloud_network_subnet.rancher_management_subnet.id
}

#======================================================================================================
# Creating the LoadBalancer

resource "hcloud_load_balancer" "rancher_management_lb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  location           = var.lb_location

  dynamic "target" {
    for_each = hcloud_server.rancher_management_nodes
    content {
      type      = "server"
      server_id = target.value.id
    }
  }
}

resource "hcloud_load_balancer_network" "rancher_management_lb_network_registration" {
  load_balancer_id = hcloud_load_balancer.rancher_management_lb.id
  subnet_id        = hcloud_network_subnet.rancher_management_subnet.id
}

resource "hcloud_load_balancer_target" "rancher_management_lb_targets" {
  count            = var.instance_count
  type             = "server"
  load_balancer_id = hcloud_load_balancer.rancher_management_lb.id
  server_id        = hcloud_server.rancher_management_nodes[count.index].id
  use_private_ip   = true
  depends_on       = [hcloud_load_balancer_network.rancher_management_lb_network_registration]
}

resource "hcloud_load_balancer_service" "rancher_management_lb_k8s_service" {
  load_balancer_id = hcloud_load_balancer.rancher_management_lb.id
  protocol         = "tcp"
  listen_port      = 6443
  destination_port = 6443
  depends_on = [hcloud_load_balancer_target.rancher_management_lb_targets]
}

resource "hcloud_load_balancer_service" "rancher_management_lb_http_service" {
  load_balancer_id = hcloud_load_balancer.rancher_management_lb.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
  depends_on = [hcloud_load_balancer_target.rancher_management_lb_targets]
}

resource "hcloud_load_balancer_service" "rancher_management_lb_https_service" {
  load_balancer_id = hcloud_load_balancer.rancher_management_lb.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
  depends_on = [hcloud_load_balancer_target.rancher_management_lb_targets]
}