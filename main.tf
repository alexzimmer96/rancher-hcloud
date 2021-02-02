module "cluster_init" {
  source = "./module-cluster-init"
  hcloud_token         = var.hcloud_token
  hcloud_ssh_key_path  = var.hcloud_ssh_key_path
  instance_count       = var.instance_count
  instance_prefix      = var.instance_prefix
  instance_type        = var.instance_type
  instance_zones       = var.instance_zones
  lb_location          = var.lb_location
  lb_name              = var.lb_name
  lb_type              = var.lb_type
  private_network_name = var.private_network_name
  ip_range             = var.ip_range
  subnet_ip_range      = var.subnet_ip_range
}

module "rancher_init" {
  source                 = "./module-rancher-init"
  letsencrypt_issuer     = var.letsencrypt_issuer
  rancher_admin_password = var.rancher_admin_password
  rancher_hostname       = var.rancher_hostname
  kubeconfig_path        = module.cluster_init.kubeconfig_path
  lb_address             = module.cluster_init.lb_address
}

module "node_init" {
  source               = "./module-node-init"
  rancher_admin_token  = module.rancher_init.rancher_admin_token
  hcloud_token         = var.hcloud_token
  rancher_hostname     = var.rancher_hostname
  lb_address           = module.cluster_init.lb_address
  hetzner_driver_id    = module.rancher_init.hetzner_driver_id
  private_network_name = var.private_network_name
}