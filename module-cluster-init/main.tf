terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.24.0"
    }
    rke = {
      source  = "rancher/rke"
      version = "1.1.7"
    }
  }
}

output "kubeconfig_path" {
  value = local_file.kube_config_server_yaml.filename
}

output "lb_address" {
  value = hcloud_load_balancer.rancher_management_lb.ipv4
}