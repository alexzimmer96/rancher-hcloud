variable "rancher_admin_token" {
  type = string
}

variable "hcloud_token" {
  type = string
}

variable "rancher_hostname" {
  type = string
}

variable "lb_address" {
  type = string
}

variable "hetzner_driver_id" {
  type = string
}

variable "use_private_networks" {
  type = bool
}

variable "private_network_name" {
  type = string
}

variable "userdata" {
  type = string
}

variable "node_template_types" {
  type = list(string)
}

variable "node_template_zones" {
  type = list(string)
}