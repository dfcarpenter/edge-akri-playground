#!/bin/sh

echo "Installing OPC-UA server on kubernetes cluster"

kubectl apply -f ./umati-robot-opc.yaml 

echo "Upgrading Arki to work with OPC-UA"
helm install akri akri-helm-charts/akri \
    --set opcua.discovery.enabled=true \
    --set opcua.configuration.enabled=true \
    --set opcua.configuration.name=akri-opcua-monitoring \
    --set opcua.configuration.brokerPod.image.repository="ghcr.io/project-akri/akri/opcua-monitoring-broker" \
    --set opcua.configuration.brokerProperties.IDENTIFIER='CNC_Monitoring' \
    --set opcua.configuration.brokerProperties.NAMESPACE_INDEX='2' \
    --set opcua.configuration.discoveryDetails.discoveryUrls[0]="opc.tcp://<SomeServer0 IP address>:<SomeServer0 port>/Quickstarts/ReferenceServer/" \
    # --set opcua.configuration.mountCertificates='true'
