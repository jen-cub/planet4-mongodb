SHELL := /bin/bash

.EXPORT_ALL_VARIABLES:

HELM_RELEASE := rchat
NAMESPACE ?= rc

CHART_NAME ?= stable/rocketchat
#CHART_VERSION ?= 1.1.5
CLUSTER ?= testrc
PROJECT ?= jendevops1
ZONE ?= australia-southeast1

dev:
		helm init --client-only
		helm repo update
		helm upgrade --install --force --wait $(HELM_RELEASE) $(CHART_NAME) \
			--namespace=$(NAMESPACE) \
			--values values.yml \
