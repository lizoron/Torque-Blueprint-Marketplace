from typing import Literal
import requests
import json
import sys
import os

baseurl = sys.argv[1]
connectionsJson = sys.argv[2]


privateIp = connectionsJson # Need to be changed!
privateKey = os.getenv("pk")
payload='username=guacadmin&password=guacadmin'
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}
response = requests.post(f"{baseurl}/guacamole/api/tokens",headers=headers,data=payload)
token = response.json()['authToken']
print(token)
url = f"{sys.argv[1]}/guacamole/api/session/data/mysql/connections?token={token}"
connectionName = "Connection"

payload = json.dumps({
  "parentIdentifier": "ROOT",
  "name": connectionName,
  "protocol": "ssh",
  "parameters": {
    "port": "22",
    "username": "ubuntu",
    "hostname": privateIp,
    "private-key": privateKey
  },
  "attributes": {
    "max-connections": "",
    "max-connections-per-user": "",
    "weight": "",
    "failover-only": "",
    "guacd-port": "",
    "guacd-encryption": "",
    "guacd-hostname": ""
  }
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)
print(payload)
print(response.text)
