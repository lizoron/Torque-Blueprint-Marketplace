#!/usr/bin/env bash

# For Debugging (print env. variables, define command tracing)
# set -o xtrace
# env
# set

#Install Docker
apt-get update -y
 apt-get install -y ca-certificates curl gnupg lsb-release
 mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
 echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
 apt-get update -y
 apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
 
 #Get all needed files
wget https://raw.githubusercontent.com/QualiTorque/TFSamples/main/resources/docker-compose.yaml
wget https://raw.githubusercontent.com/QualiTorque/TFSamples/main/resources/initdb.sql
#Install mysql client
sudo apt-get update -y
sudo apt-get install mysql-client -y

#Init DB
