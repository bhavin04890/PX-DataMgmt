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

echo "Deleting the demo applications"

eksctl utils write-kubeconfig --cluster demo-px-day -r us-west-2
sleep 5

kubectl delete pods 
kubectl delete pvc 
sleep 5 

kubectl delete deploy --all -n demo
kubectl delete svc --all -n demo
kubectl delete pvc --all -n demo 
kubectl delete ns demo
sleep 5

helm uninstall jenkins -n jenkins
kubectl delete pvc --all -n jenkins 
kubectl delete ns jenkins
sleep 5 

kubectl delete deploy pgbench -n pg1
kubectl delete pvc --all -n pg1 
kubectl delete ns pg1 
sleep 5

kubectl delete stc --all -n kube-system
sleep 60
eksctl delete cluster -f create-eks-cluster.yaml

