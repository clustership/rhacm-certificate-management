#!/bin/bash

PULL_SECRET=$HOME/pull-secret.json

podman pull --authfile ${PULL_SECRET} registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14

mkdir -p $HOME/kustomize-plugins
chmod 775 $HOME/kustomize-plugins

podman run -v $HOME/kustomize-plugins:/.config:Z --log-driver=none --rm registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14 /exportkustomize.sh /.config
