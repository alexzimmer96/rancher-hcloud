# Rancher on Hetzner Cloud

This repository contains Terraform templates for deploying a highly available RKE cluster on Hetzner Cloud and installing Rancher into it.
The Rancher installation can be used to create more clusters using the [Hetzner UI Driver](https://github.com/mxschmitt/ui-driver-hetzner).

Please feel free to make contributions or use this for your own projects.

## Running the Scripts
First, take the terraform.tfvars.example and make your configuration.
After this, you're ready to run.

```bash
# Initalizing the module
terraform init

# Creating the cluster
terraform apply -target=module.cluster_init

# Installing Cert-Manager and Rancher
terraform apply -target=module.rancher_init

# Create default node templates
terraform apply -target=module.node_init
```

## Project Structure

This Project consists of three modules.
The `module-cluster-init` is for creating a basic RKE-Cluster on Hetzner Cloud, including server provisioning.
The `module-rancher-init` is for installing Cert-Manager and Rancher on top of your provisioned cluster.
The `module-node-init` creates Node Templates for Hetzner Cloud on your newly created Rancher instance.

### Why is this divided into modules?

First, there is a bug in the Terraform k8s-provider.
The existence of the kubeconfig-file is checked at planning phase.
Unfortunately, that does not work because the cluster did not exist in planning phase.

Second, this gives you the possibility to create a DNS-Entry for the Load Balancer.
This step could be automated, but my personal domain is not at a DNS provider which has an API to automate this.

## Next Steps

At the moment, there is no integration for the [hcloud-controller-manager](https://github.com/hetznercloud/hcloud-cloud-controller-manager) or their [CSI driver](https://github.com/hetznercloud/csi-driver).
This could be added to provide a tighter integration to the Hetzner Cloud Environment.

Also, i want to add a module to perform the installation of the [Hetzner UI Driver](https://github.com/mxschmitt/ui-driver-hetzner)

Maybe some of this code can be used to create a more generic Terraform project to build production ready RKE clusters on Hetzner.