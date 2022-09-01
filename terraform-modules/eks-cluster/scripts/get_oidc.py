import json
import sys
import os

eks_cluster = sys.argv[1]
cmd = 'aws eks describe-cluster --name ' + eks_cluster + ' --query "cluster.identity.oidc.issuer" --output text'
stream = os.popen(cmd)
aws_output = stream.read().strip()
oidc = aws_output.rsplit("/")[-1]
payload = json.dumps({'oidc':oidc})
print(payload)