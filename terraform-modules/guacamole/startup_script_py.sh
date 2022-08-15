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
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose >> log.txt

 #Get all needed files
wget https://raw.githubusercontent.com/QualiTorque/TFSamples/main/resources/docker-compose.yaml
wget https://raw.githubusercontent.com/QualiTorque/TFSamples/main/resources/initdb.sql
wget https://raw.githubusercontent.com/QualiTorque/Torque-Blueprint-Marketplace/main/resources/configure_guacamole.py
# #Install mysql client
sudo apt-get update -y
sudo apt-get install mysql-client -y


# #Start and init DB
MYSQK_READY_TIME='15s'
# # docker-compose down - probably unnecessary 
docker-compose up -d mysql
sleep $MYSQK_READY_TIME
mysql -h 127.0.0.1 -P 3306 -u guacamole --password=guacamole < initdb.sql
# #Start Service
docker-compose up -d
sleep 10

private_key="\"${private_key}"\"
export pk="${private_key}"

# #Get Guacamole API token and create SSH connection
python3 configure_guacamole.py http://localhost:8080 ${connection} 
