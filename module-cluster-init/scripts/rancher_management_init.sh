#!/bin/bash

sudo apt-get update && apt-get upgrade -y

# Disable password based authentication for SSH
# sed -i 's/[#]*PermitRootLogin yes/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
# sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
# systemctl restart sshd

# Installing and enabling fail2ban
sudo apt-get install -y fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# Installing Docker
curl -sL https://releases.rancher.com/install-docker/19.03.sh | sh
sudo systemctl enable docker
sudo systemctl start docker