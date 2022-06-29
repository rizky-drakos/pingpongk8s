#!/bin/bash

# Where we store our k8s templates.
TEMPLATES="infra"

kubectl delete -f ${TEMPLATES}/ping-cronjob.yaml
kubectl delete -f ${TEMPLATES}/pong-deploy.yaml
kubectl delete -f ${TEMPLATES}/pong-svc.yaml
