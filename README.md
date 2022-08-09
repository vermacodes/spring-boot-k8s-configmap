# spring-boot-k8s-configmap
Demonstrate use of config maps to host properties. 

## Prerequisites 
- minikube (or any kubernetes cluster)
- docker
- helm
- maven

## Build & Install

- Clone the project `git clone git@github.com:ashishvermapu/spring-boot-k8s-configmap.git`
- Change directory to project root `cd spring-boot-k8s-configmap`
- Run script `sh BuildAndInstall.sh`

Note : If you're a windows user, either use `git bash` or use `WSL` or good luck.

# UPDATE

## Introduciton
This was recently updated to be deployed to AKS. You can build on your own or use a publicly available image already built.

## Build & Deploy
### Build
- I've added `AKSBuildAndInstall.sh` but not tested yet.
- Build jar `mvn clean install` this will create a jar file in `target` directory.
- Pack the jar in the image `docker build -t demo .`
- Tag the image to be pushed to your container registry. If you are using ACR then it would be like `docker tag demo:latest <acrname>.azurecr.io/demo:latest`
- Push to container registry `docker push <acrname>.azurecr.io/demo:latest`

### Install
- Deploy to your AKS cluster using Helm Chart `helm install demo ./helm/demo`
- Priave Service `helm install demo ./helm/demo --set service.internal=true`
- Enable monitoring using Applicaiton Insights `helm install demo ./helm/demo --set monitor.enabled=true --set monitor.aiConnectionString='connection string of ai'`
