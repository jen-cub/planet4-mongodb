SHELL := /bin/bash

.EXPORT_ALL_VARIABLES:

HELM_RELEASE := p4-mongodb
NAMESPACE ?= mongodb

CHART_NAME ?= bitnami/mongodb
#CHART_VERSION ?= 1.1.5
CLUSTER ?= testrc
PROJECT ?= jendevops1
ZONE ?= australia-southeast1

dev:
		helm init --client-only
		helm repo add bitnami https://charts.bitnami.com/bitnami
		helm repo update
		helm upgrade --install --force --wait $(HELM_RELEASE) $(CHART_NAME) \
			--namespace=$(NAMESPACE) \
			--values values.yml \
