#!/bin/bash

# Always run from the root of the project.

helm delete demo
mvn clean install
docker build -t demo .
docker tag demo:latest $1/demo:latest
docker push $1/demo:latest
helm install demo ./helm/demo
sleep 2s
kubectl get all
