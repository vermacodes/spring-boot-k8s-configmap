#!/bin/bash

# Always run from the root of the project.

helm delete demo
mvn clean install
eval $(minikube docker-env)
docker build -t demo .
helm install demo ./helm/demo
sleep 2s
kubectl get all
