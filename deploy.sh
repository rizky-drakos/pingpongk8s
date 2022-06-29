#!/bin/bash

# Where we store our k8s templates.
TEMPLATES="infra"

# First we deploy the pong service
# and wait 10s untill the service is ready.
kubectl apply -f ${TEMPLATES}/pong-deploy.yaml
kubectl apply -f ${TEMPLATES}/pong-svc.yaml
echo "Waiting for the PONG service.." && sleep 10 >/dev/null

# Now we deploy the ping cronjob.
kubectl apply -f ${TEMPLATES}/ping-cronjob.yaml

echo "Logs of the following pods can be viewed with \`kubectl logs --follow <pod>\`:"
kubectl get pods -l app=pong-deploy --no-headers | awk '{print $1}'
