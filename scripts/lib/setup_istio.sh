#!/usr/bin/env bash

# Get project root path
ROOT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/../..

# Install istio on cluster
istioctl install -y -f ${ROOT_PATH}/scripts/templates/istio-config.yaml

# Enable sidecar injection
kubectl label namespace default istio-injection=enabled