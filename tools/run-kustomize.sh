#!/bin/bash

export KUSTOMIZE_PLUGIN_HOME=$HOME/kustomize-plugins/kustomize/plugin

kustomize $@ --enable-alpha-plugins
