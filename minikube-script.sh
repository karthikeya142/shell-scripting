Ubuntu:


#!/bin/bash

apt update -y
sudo apt install curl wget apt-transport-https -y
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube 
sudo minikube version
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
//sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
s//udo echo "$(cat kubectl.sha256) kubectl" | sha256sum --check 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
//sudo kubectl version --client
sudo kubectl version --client --output=yaml   
sudo minikube start --driver=docker --force
	





RedHat: 

yum install docker -y
systemctl start docker
systemctl status docker
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo yum install iptables -y
yum install conntrack -y
minikube start --driver=docker --force
minikube status 




COMMAND TO CREATE A POD:
kubectl run pod-name --image=image-name

TO SEE LIST OF PODS:
kubectl get po

TO DELETE A POD:
kubectl delete pod pod-name

MANIFEST FILE TO CREATE A POD:
apiVersion: v1
kind: Pod
metadata:
    name: pod-1
spec:
    containers:
      - name: cont-1
        image: nginx
        ports:
          - containerPort: 80
