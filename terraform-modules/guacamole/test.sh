token="tes123t"
echo $$token

# connection="10.14.15.16"
# echo '{
#     "parentIdentifier": "ROOT",
#     "name": "amir_ssh_test",
#     "protocol": "ssh",
#     "parameters": {
#         "port": "22",
#         "hostname": '${connection}'
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


# json=$(curl --location --request POST 'http://localhost:8080/guacamole/api/tokens' \
# --header 'Content-Type: application/x-www-form-urlencoded' \
# --data-urlencode 'username=guacadmin' \
# --data-urlencode 'password=guacadmin')
# token=$( jq -r ".authToken" <<<"$json" )
# echo $token
# echo 'http://localhost:8080/guacamole/api/session/data/mysql/connections?token='${token}
# curl --location --request POST 'http://localhost:8080/guacamole/api/session/data/mysql/connections?token='${token}' \
# --header 'Content-Type: application/json' \
# --data-raw '{
#     "parentIdentifier": "ROOT",
#     "name": "amir_ssh_test",
#     "protocol": "ssh",
#     "parameters": {
#         "port": "22",
#         "hostname": "localhost"
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