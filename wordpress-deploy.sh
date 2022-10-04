#!/bin/sh

kubectl create ns wordpress
sleep 10

kubectl apply -f wp-mysql-pvc.yaml -n wordpress
sleep 10

kubectl apply -f wp-mysql-app.yaml -n wordpress
sleep 10

kubectl apply -f wp-mysql-svc.yaml -n wordpress
sleep 10

kubectl apply -f wp-pvc.yaml -n wordpress
sleep 10

kubectl apply -f wp-app.yaml -n wordpress
sleep 10

kubectl apply -f wp-svc.yaml -n wordpress
sleep 30 

echo "Wordpress Endpoint:"
kubectl get svc -n wordpress wordpress 
