import requests
import json
import sys
import os


baseurl = sys.argv[1]
privateKey = sys.argv[2]
connection = sys.argv[3]
payload='username=guacadmin&password=guacadmin'
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}
response = requests.post(f"{baseurl}/guacamole/api/tokens",headers=headers,data=payload)
token = response.json()['authToken']
print(token)
url = f"{sys.argv[1]}/guacamole/api/session/data/mysql/connections?token={token}"
print(url)

payload = json.dumps({
  "parentIdentifier": "ROOT",
  "name": "Connection",
  "protocol": "ssh",
  "parameters": {
    "port": "22",
    "username": "ubuntu",
    "hostname": connection,
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

print(response.text)
