#!/bin/sh

echo "Starting Post Create Command"

k3d cluster delete

k3d cluster create -p '1883:1883@loadbalancer' -p '8883:8883@loadbalancer' -p '6001:6001@loadbalancer'

echo "Installing E4K"
helm install e4k oci://e4kpreview.azurecr.io/helm/az-e4k --version 0.1.0-amd64 --set e4kdmqtt.broker.backend.chainCount=1


echo "Ending Post Create Command"