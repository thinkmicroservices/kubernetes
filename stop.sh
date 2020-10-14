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

echo -e "$HIGHLIGHT deleting ThinkMicroservices reference implementation from Kubernetes"


echo -e "$HIGHLIGHT delete reference implementation services"

microk8s.kubectl delete service peer-signaling-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment peer-signaling-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service feature-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment feature-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service telemetry-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment telemetry-service --namespace $K8S_NAMESPACE


microk8s.kubectl delete service administration-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment administration-service --namespace $K8S_NAMESPACE


microk8s.kubectl delete service account-history-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment  account-history-service --namespace $K8S_NAMESPACE


microk8s.kubectl delete service account-profile-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment account-profile-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service api-gateway-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment api-gateway-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service auth-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment auth-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service notification-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment notification-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service sms-outbound-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment sms-outbound-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service email-outbound-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment email-outbound-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service content-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment content-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service discovery-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment discovery-service --namespace $K8S_NAMESPACE

microk8s.kubectl delete service config-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment config-service --namespace $K8S_NAMESPACE



echo -e "$HIGHLIGHT delete infrastructure services"

microk8s.kubectl delete service mongo-express --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment mongo-express --namespace $K8S_NAMESPACE


microk8s.kubectl delete service mongo-db-service --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment mongo-db-service --namespace $K8S_NAMESPACE


microk8s.kubectl delete service rabbitmq --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment rabbitmq --namespace $K8S_NAMESPACE

microk8s.kubectl delete service postgresadmin --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment postgresadmin --namespace $K8S_NAMESPACE

microk8s.kubectl delete service postgresdb --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment postgresdb --namespace $K8S_NAMESPACE

microk8s.kubectl delete service grafana --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment grafana --namespace $K8S_NAMESPACE

microk8s.kubectl delete service prometheus --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment prometheus --namespace $K8S_NAMESPACE

microk8s.kubectl delete service kibana --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment kibana --namespace $K8S_NAMESPACE

microk8s.kubectl delete service elasticsearch --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment elasticsearch --namespace $K8S_NAMESPACE

microk8s.kubectl delete service fluentd --namespace $K8S_NAMESPACE
microk8s.kubectl delete deployment fluentd --namespace $K8S_NAMESPACE

echo -e "$HIGHLIGHT delete config maps"
microk8s.kubectl delete configmap prometheus  --namespace $K8S_NAMESPACE
echo "delete persistent volume claim"

microk8s.kubectl delete persistentvolumeclaim grafana-persistent-volume-claim --namespace $K8S_NAMESPACE
microk8s.kubectl delete persistentvolumeclaim grafana-persistent-volume-claim --namespace $K8S_NAMESPACE
echo -e "$HIGHLIGHT delete namespace: $K8S_NAMESPACE"

microk8s.kubectl delete namespaces $K8S_NAMESPACE

echo -e "$COMPLETED deleted reference implementation services"



