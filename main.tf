terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.23.0"
    }
    rke = {
      source  = "rancher/rke"
      version = "1.1.5"
    }
  }
}

module "cluster_init" {
  source = "./module-cluster-init"
  hcloud_token         =  var.hcloud_token
  hcloud_ssh_key_path  =  var.hcloud_ssh_key_path
  instance_count       =  var.instance_count
  instance_prefix      =  var.instance_prefix
  instance_type        =  var.instance_type
  instance_zones       =  var.instance_zones
  lb_location          =  var.lb_location
  lb_name              =  var.lb_name
  lb_type              =  var.lb_type
  private_network_name =  var.private_network_name
}

module "rancher_init" {
  source             = "./module-rancher-init"
  letsencrypt_issuer = var.letsencrypt_issuer
  rancher_hostname   = var.rancher_hostname
  kubeconfig_path    = module.cluster_init.kubeconfig_path
  lb_address         = module.cluster_init.lb_address
}