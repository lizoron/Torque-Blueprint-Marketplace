#!/usr/bin/env bash

# For Debugging (print env. variables, define command tracing)
# set -o xtrace
# env
# set

#Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
sudo apt install -y docker-compose

#Install Guacamole
git clone "https://github.com/boschkundendienst/guacamole-docker-compose.git"
cd guacamole-docker-compose
./prepare.sh
docker-compose up -d

