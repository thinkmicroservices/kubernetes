#!/bin/bash

# tested on (microk8s)

K8S_NAMESPACE=default

while getopts 'n:' opt; do
    case $opt in
        n) K8S_NAMESPACE=$OPTARG ;;
        *) echo 'error in command line parsing' >&2
           exit 1
    esac
done



HIGHLIGHT='\U0001F449'
COMPLETED='\U0001F44D'

echo -e "$HIGHLIGHT deploying ThinkMicroservices reference implementation to Kubernetes"

echo -e "$HIGHLIGHT create namespace $K8S_NAMESPACE"

#microk8s.kubectl apply -f ./thinkmicroservices-namespace.yaml 
microk8s.kubectl create namespace $K8S_NAMESPACE

echo -e "$HIGHLIGHT provision storage"


microk8s.kubectl apply -f grafana-persistent-volume-claim.yaml --namespace  $K8S_NAMESPACE
microk8s.kubectl apply -f prometheus-persistent-volume-claim.yaml --namespace  $K8S_NAMESPACE
 
echo -e "$HIGHLIGHT deploy config maps"
microk8s.kubectl apply -f prometheus-configmap.yaml --namespace  $K8S_NAMESPACE

echo -e "$HIGHLIGHT deploy infrastructure services"

microk8s.kubectl apply -f fluentd-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f fluentd-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f elasticsearch-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f elasticsearch-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f kibana-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f kibana-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f prometheus-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f prometheus-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f grafana-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f grafana-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f postgresdb-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f postgresdb-service.yaml --namespace $K8S_NAMESPACE


microk8s.kubectl apply -f postgresadmin-service.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f postgresadmin-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f rabbitmq-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f rabbitmq-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f mongo-db-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f mongo-db-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f mongo-express-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f mongo-express-service.yaml --namespace $K8S_NAMESPACE

echo -e "$HIGHLIGHT deploy reference implementation services"
microk8s.kubectl apply -f config-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f config-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f discovery-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f discovery-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f content-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f content-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f email-outbound-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f email-outbound-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f sms-outbound-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f sms-outbound-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f notification-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f notification-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f auth-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f auth-service-service.yaml --namespace $K8S_NAMESPACE
 
microk8s.kubectl apply -f api-gateway-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f api-gateway-service-service.yaml --namespace $K8S_NAMESPACE


microk8s.kubectl apply -f account-profile-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f account-profile-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f account-history-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f account-history-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f administration-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f administration-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f telemetry-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f telemetry-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f feature-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f feature-service-service.yaml --namespace $K8S_NAMESPACE

microk8s.kubectl apply -f peer-signaling-service-deployment.yaml --namespace $K8S_NAMESPACE
microk8s.kubectl apply -f peer-signaling-service-service.yaml --namespace $K8S_NAMESPACE

echo -e "$COMPLETED deployed reference implementation services"
