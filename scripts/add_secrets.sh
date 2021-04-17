#!/usr/bin/env bash

# Get project root path
ROOT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/..

# Load libs
source ${ROOT_PATH}/scripts/lib/load_env.sh

# Minio secret
kubectl create secret generic minio-secret \
  --from-literal=accesskey=$MINIO_ACCESS_KEY \
  --from-literal=secretkey=$MINIO_SECRET_KEY

# MongoDB secret
kubectl create secret generic mongodb-secret \
  --from-literal=mongodb-root-password=$MONGODB_ROOT_PASSWORD \
  --from-literal=mongodb-password=$MONGODB_PASSWORD

# Add more secrets if you add a service...