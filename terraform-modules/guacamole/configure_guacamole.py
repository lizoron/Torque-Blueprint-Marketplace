import requests
import json
import sys
import os


baseurl = sys.argv[1]
pk = sys.argv[2]
connection = sys.argv[3]
payload='username=guacadmin&password=guacadmin'
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}
response = requests.post(f"{baseurl}/guacamole/api/tokens",headers=headers,data=payload)
token = response.json()['authToken']
# with open(file="pk") as f:
#   pk=f.read()
# pk=json.dumps(pk)
# pk="-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA61v14eTGe8joQLWFAoeRtH99u8mLjezluB+5kUeJo5Z8Q25K\nvFe/uEoIE6H0dZFCyH7J5Wq30oTN8iwmrbLndc8d/F7Al/AwuQWQYSeRPQHckJ4S\nZizdZoRXmtBmNy8Z4NdrNx8Lz9Pzz3nl+EMB/zyu+/yQMtPbk0rGWlz64GTY04AW\nMgdH9RO6Wyjg7RJKHT2tgjF0ASP+9skiWFrkKajG/2xHdT55qDZWL2OF5xk7huvy\n3nxoQfEwAztxov5WKS4uoPUoL97t5Ht2BzuoMGSZuSWaZTuwnuHZ486y4UyhhTdZ\na503kEq8W59WmKPFDTz0Mh8Pbkpn4/Cl3oz6IQIDAQABAoIBAEJzzJDjT0dUCn96\nwPtd273i4VVMKqL/6Dx8eKCUWkBeFOfVFDTpcbBO9sjUSXmIchq58bdc0loWNS/T\nV3hjswaIXCcNecNshdU3xPQpf9CB3gzXFMrUkA6J/1Iu1S1vlxbsu9DsayFa7tP9\nzvixsramI6HyRaSUPMLxsd+BsTP5uq4L8WHChKaEHeuHOqE/lrTJ6qYwwibHgaTS\n43kd0+Awnpa+rxz8GMytY8LHGMCQM2X5LpwES+KRT3izdTVupSfmC8exRPm5KuKK\nVzspqaceG6YbYfZ4yepshougp/zVuZKtAZ53V6Otj6l8lsUQvl3JTl5M98l+m2X2\n7OuWqAECgYEA/db+IRofhPAxHXYcY5KMrGQzodHbHvByaP0ty1IDVskxQwqdD0vV\nbGV05G2mP/APfHSyfIoos4HGzEXaxzNeuzt0n+AlC8EtKIXjrCc/0kFyggpNJUMh\nxmBkOzLRstKxpKv9vhgXlKFgfQ3X4tpW9Dr42Km+B7/Ta5glv3qQJLECgYEA7Vy0\n4KZLgV9MlO5GShpMLKjCxrwFpIn5hWyKEefjKOhtyukBKkayIWTCUuAGmr/oJ+jE\naU7dD001ijpncjLrDWP/A1RHIwge8nmjDaUXG1Fz/bnQ7jCsOhwXVtvU/sN8dl5H\n0yvGaOVTH+JcpMBMi//ex2wcGoSmgnx1htcLSHECgYEAmj9ajaLiJFYQgmaTOa6D\n7P22ok5zaImT/Fhcy4A6pzH6zVJVvkXGmufL8ELxE0k9H9OJ4kPSF8J0mwyXtRRy\nLDQk2kHKQSpR1p4Fi0cOcSVz/7Fiz5HLpFBOl+p5osCFUhtxRWI+cgLeLx+KYD9t\nN1vee0oqP2tBfdAmoARKMwECgYEAp2kejd/cG0gqzFPuMW+w0ELK9b5BQJar7YXr\nL8vcdMrSPS3vy3CHTHQzdp5ZKiY2SIesmBWuZo9vNqoQsgPlstEXWLLFZZjhsuVF\nsmcBEBx38blv+b9MicOsVm/AH1ujWh0PDYqvauZrpW5TJ0QV+RwjdYXzoGR0yE2d\n2terNpECgYB8mIbekPftZ+7dOJvJFhTVnf4+kqyq7JMX99QDjf4xoMLCFejgsSnD\nl07CqzyR4l4wJ4MY3IxSqEkhafiAhVSlZpIRaJa+gihfw1vEVYMzp4Y4WVbL7wpA\np7qd6WlZTUUU068V5arcduDs75cfZWj5ZMx1TdouGzDVBmsLeCmBiw==\n-----END RSA PRIVATE KEY-----\n"
print(token)
url = f"{sys.argv[1]}/guacamole/api/session/data/mysql/connections?token={token}"
print(url)

payload = json.dumps({
  "parentIdentifier": "ROOT",
  "name": "python_connection_full2",
  "protocol": "ssh",
  "parameters": {
    "port": "22",
    "username": "ubuntu",
    "hostname": connection,
    "private-key": pk
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
