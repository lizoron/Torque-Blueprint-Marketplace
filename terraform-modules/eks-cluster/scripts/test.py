""" import json
import os

stream = os.popen('aws eks describe-cluster --name qualidev2-eks --query "cluster.identity.oidc.issuer" --output text')
output = stream.read().strip()
oidc = output.rsplit("/")[-1]
payload = {'oidc':oidc}
print(oidc) """

import sys
 
for input in sys.stdin:
    print(f'Input : {input}')

