variable "hcloud_token" {
    type = string
    description = "The token that is used to interact with the Hetzner Cloud API."
}

variable "hcloud_ssh_key_path" {
    type = string
    default = "~/.ssh/rancher_management"
    description = "Path to the key you want to use register on your Hetzner Cloud machines. The public key must have the same location and a .pub ending."
}

variable "letsencrypt_issuer" {
    type = string
    description = "Mail address that is used to create the Lets Encrypt Issuer. You will get notifications if your certs are expiring."
}

variable "rancher_admin_password" {
    type = string
    description = "Password that is used for you Rancher Admin login when the Rancher installation gets bootstrapped."
}

variable "rancher_hostname" {
    type = string
    default = null
    description = "Hostname which Hetzner should be available at. You need to create a DNS A-Record pointing on the Load Balancer's address. This will default to a nip.io subdomain."
}

variable "instance_prefix" {
    type = string
    default = "rancher-management"
    description = "The prefix that comes before the index-value to form the name of the machine."
}

variable "instance_count" {
    type = number
    default = 3
    description = "Number of instances that will be deployed. Should be a odd number (1, 3, 5, etc.)."
}

variable "instance_type" {
    type = string
    default = "cx31"
    description = "Hetzner instance type that is used for the machines. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types."
}

variable "instance_zones" {
    type = list(string)
    default = ["nbg1", "fsn1", "hel1"]
    description = "All zones over which the nodes are distributed."
}

variable "lb_name" {
    type = string
    default = "rancher-management-lb"
    description = "Name of the Load Balancer that is placed in front of your instaces."
}

variable "lb_type" {
    type = string
    default = "lb11"
    description = "Hetzner Load Balancer type. You can use the Hetzner Cloud CLI or browse their website to get a list of valid instance types."
}

variable "lb_location" {
    type = string
    default = "nbg1"
    description = "Location of the Load Balancer."
}

variable "private_network_name" {
    type = string
    default = "kubernetes-internal"
    description = "Name of the private network that is created for your nodes. "
}

variable "ip_range" {
    type = string
    default = "172.16.0.0/12"
    description = "Ip Range to use for setting up Hetzner network."
}

variable "subnet_ip_range" {
    type = string
    default = "172.16.1.0/24"
    description = "Subnet Ip Range to use for setting up Hetzner network."
}

variable "use_private_networks" {
  type = bool
  default = false
  description = "Use private network in node templates."
}

variable "node_cloud_init_path" {
    type = string
    default = ""
    description = "Path to the cloud init user data for node templates."
}

variable "node_template_types" {
    type = list(string)
    default = ["cx", "cx-ceph", "cpx", "ccx"]
    description = "All server types for which a node template will be created"
}

variable "node_template_zones" {
    type = list(string)
    default = ["nbg1", "fsn1", "hel1"]
    description = "All zones for which a node template will be created."
}