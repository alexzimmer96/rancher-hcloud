resource "rke_cluster" "rancher_management_cluster" {
  cluster_name       = "rancher-management"
  kubernetes_version = "v1.21.7-rancher1-1"

  dynamic "nodes" {
    for_each = hcloud_server.rancher_management_nodes
    content {
      address          = nodes.value.ipv4_address
      internal_address = hcloud_server_network.rancher_node_subnet_registration[nodes.key].ip
      role             = ["controlplane", "worker", "etcd"]
      user             = "root"
      ssh_agent_auth   = true
      ssh_key          = file(var.hcloud_ssh_key_path)
    }
  }

  upgrade_strategy {
    drain                  = true
    max_unavailable_worker = "20%"
  }

  authentication {
    sans = [
      hcloud_load_balancer.rancher_management_lb.ipv4
    ]
  }

}

resource "local_file" "kube_config_server_yaml" {
  filename = "./kube_config.yaml"
  content  = rke_cluster.rancher_management_cluster.kube_config_yaml
}
