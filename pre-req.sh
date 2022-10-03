#!/bin/bash

if [ ! -f ~/usr/local/bin/eksctl ]; then
	echo "Step 1: Installing eksctl to deploy Amazon EKS clusters"
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
	sudo cp /tmp/eksctl /usr/local/bin
	echo "eksctl successfully installed with version:" 
	eksctl version
fi

if [ ! -f ~/usr/local/bin/kubectl ]; then
	echo " Step 2: Installing kubectl"
    curl --silent -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
    chmod +x kubectl
	sudo cp ./kubectl /usr/local/bin/
	export PATH=$PATH:/usr/local/bin/
	echo "kubectl installed successfully with version:"
	kubectl version --client
fi

echo "Step 3: Deploying EKS cluster. This might take close to 20 minutes"
eksctl create cluster -f create-eks-cluster.yaml

kubectl get nodes 

#kubectl create ns demo

#echo "Step 4: Deploying Demo Applicatons"
#kubectl create ns demo
#sleep 5s
#kubectl apply -f postgres.yaml -n demo
#sleep 10s 
#kubectl apply -f k8s-logo.yaml -n demo
#sleep 30s 
#kubectl get all -n demo
#sleep 10s
#kubectl get pvc -n demo

#echo "Demo Applications deployed successfully!"

#echo "Application Endpoints:"
#kubectl get svc -n demo 

echo "------- Lab Ready to use -------"
