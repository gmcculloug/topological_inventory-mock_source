#!/usr/bin/env bash

oc process -f ./openshift/secrets/sources-secrets.yml | oc apply -f -

oc process -f ./openshift/builds/sources-api.yml | oc apply -f -
oc start-build sources-api

oc process -f ./openshift/builds/topological-inventory-persister.yml | oc apply -f -
oc start-build topological-inventory-persister

oc process -f ./openshift/builds/topological-inventory-sync.yml | oc apply -f -
oc start-build topological-inventory-sync

oc process -f ./openshift/builds/topological-inventory-mock-collector.yaml | oc apply -f -
oc start-build topological-inventory-mock-collector
