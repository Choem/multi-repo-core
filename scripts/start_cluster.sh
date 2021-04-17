#!/usr/bin/env bash

set -o errexit

# Get project root path
ROOT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/..

# Load libs
source ${ROOT_PATH}/scripts/lib/load_env.sh
source ${ROOT_PATH}/scripts/lib/k3d_cluster_status.sh

CLUSTER_STATUS=$(k3d_cluster_status $CLUSTER_NAME)

# Based on the cluster status create, start or print message
if [ $CLUSTER_STATUS -eq 0 ]; then
    k3d registry create $REGISTRY_NAME --port $REGISTRY_PORT || true

    k3d cluster create $CLUSTER_NAME \
        --port 9080:80@loadbalancer \
        --port 9443:443@loadbalancer \
        --k3s-server-arg '--no-deploy=traefik' \
        --registry-use $REGISTRY_NAME:$REGISTRY_PORT

    source ${ROOT_PATH}/scripts/add_secrets.sh
elif [ $CLUSTER_STATUS -eq 1 ]; then
    k3d cluster start $CLUSTER_NAME
elif [ $CLUSTER_STATUS -eq 2 ]; then
    echo "cluster: $CLUSTER_NAME is already running!"
fi