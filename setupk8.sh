#!/bin/bash
#
# edited by me

export PROJECT='jendevops1'
export CLUSTER='testrc'
export ZONE='australia-southeast1-c'

gcloud beta container --project "$PROJECT" clusters create "$CLUSTER" --zone "$ZONE" --no-enable-basic-auth --cluster-version "1.14.10-gke.17" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/jendevops1/global/networks/default" --subnetwork "projects/jendevops1/regions/australia-southeast1/subnetworks/default" --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --no-enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0

helm init
kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl --namespace kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm repo add bitnami https://charts.bitnami.com/bitnami
