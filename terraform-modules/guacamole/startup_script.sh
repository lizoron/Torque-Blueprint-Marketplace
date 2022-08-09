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

#Install mysql client
sudo apt-get update -y
sudo apt-get install mysql-client -y

#Install jq
sudo apt install jq -y

#Start and init DB
MYSQK_READY_TIME='15s'
# docker-compose down - probably unnecessary 
docker-compose up -d mysql
sleep $MYSQK_READY_TIME
mysql -h 127.0.0.1 -P 3306 -u guacamole --password=guacamole < initdb.sql
#Start Service
docker-compose up -d
#Get Guacamole API token
sleep '5s'
json=$(curl --location --request POST 'http://localhost:8080/guacamole/api/tokens' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=guacadmin' \
--data-urlencode 'password=guacadmin')
token=$( jq -r ".authToken" <<<"$json" )
data=
echo $token
private_key="\"${private_key}"\"
echo ${private_key}
private_key=$(jq -sR . <<< "$private_key")
# private_key=$(jq -sR . <<< ${private_key})
echo ${private_key}
echo $private_key
# curl --location --request POST 'http://localhost:8080/guacamole/api/session/data/mysql/connections?token='$token \
# --header 'Content-Type: application/json' \
# --data-raw '{
#     "parentIdentifier": "ROOT",
#     "name": "amir_ssh_test",
#     "protocol": "ssh",
#     "parameters": {
#         "port": "22",
#         "hostname":'"\"${connection}"\"',
#         "private-key": '${private_key}'
#     },
#     "attributes": {
#         "max-connections": "",
#         "max-connections-per-user": "",
#         "weight": "",
#         "failover-only": "",
#         "guacd-port": "",
#         "guacd-encryption": "",
#         "guacd-hostname": ""
#     }
# }'
# curl --location --request POST 'http://localhost:8080/guacamole/api/session/data/mysql/connections?token='$token \
# --header 'Content-Type: application/json' \
# --data-raw '{
#     "parentIdentifier": "ROOT",
#     "name": "amir_ssh_test",
#     "protocol": "ssh",
#     "parameters": {
#         "port": "22",
#         "hostname":'"\"${connection}"\"',
#         "private-key": $private_key1
#     },
#     "attributes": {
#         "max-connections": "",
#         "max-connections-per-user": "",
#         "weight": "",
#         "failover-only": "",
#         "guacd-port": "",
#         "guacd-encryption": "",
#         "guacd-hostname": ""
#     }
# }'