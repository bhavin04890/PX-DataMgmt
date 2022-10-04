#!/bin/sh

kubectl apply -f autopilot.yaml
sleep 30 

kubectl apply -f autopilotrule.yaml
sleep 10
kubectl apply -f namespaces.yaml
sleep 5
kubectl apply -f autopilot-postgres.yaml -n pg1
sleep 10
kubectl apply -f autopilot-app.yaml -n pg1
sleep 10
