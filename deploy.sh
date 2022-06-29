#!/bin/bash

# Where we store our k8s templates.
TEMPLATES="infra"

# First we deploy the pong service.
kubectl apply -f ${TEMPLATES}/pong-deploy.yaml
kubectl apply -f ${TEMPLATES}/pong-svc.yaml

# Now we deploy the ping cronjob and wait
# for another 60s.
kubectl apply -f ${TEMPLATES}/ping-cronjob.yaml
echo "Waiting for the PING cron service.." && sleep 60 >/dev/null

echo "Logs of the following pods can be viewed with:"
pods=$(kubectl get pods -l app=pong-deploy --no-headers | awk '{print $1}')
for pod in ${pods}
do
    echo "+ kubectl logs --follow ${pod}" 
done
