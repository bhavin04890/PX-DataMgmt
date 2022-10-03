#!/bin/sh
echo "Nodes in us-west-2a:"
kubectl get nodes -l failure-domain.beta.kubernetes.io/zone=us-west-2a

echo "Nodes in us-west-2b:"
kubectl get nodes -l failure-domain.beta.kubernetes.io/zone=us-west-2b

echo "Nodes in us-west-2c:"
kubectl get nodes -l failure-domain.beta.kubernetes.io/zone=us-west-2c
