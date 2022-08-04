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
sudo usermod -aG docker ubuntu
sudo apt install -y docker-compose

#Run service
wget https://raw.githubusercontent.com/QualiTorque/TFSamples/main/resources/docker-compose.yaml
docker-compose up

#Install mysql client
sudo apt-get update -y
sudo apt-get install mysql-client
