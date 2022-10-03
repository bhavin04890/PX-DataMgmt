#!/bin/bash

echo "Cleaning up the AWS Immersion Day labs" 

if [ ! -f ~/usr/local/bin/eksctl ]; then
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
	sudo cp /tmp/eksctl /usr/local/bin
fi

if [ ! -f ~/usr/local/bin/kubectl ]; then
	curl --silent -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
	chmod +x kubectl
	sudo cp ./kubectl /usr/local/bin/
	export PATH=$PATH:/usr/local/bin/
fi

echo "Deleting the destination cluster"

eksctl utils write-kubeconfig --cluster demo-px-day -r us-west-2
sleep 5
kubectl delete stc --all -n kube-system
sleep 60
eksctl delete cluster -f create-eks-cluster.yaml

