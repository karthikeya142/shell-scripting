#!/bin/bash
# Install AWS CLI (version 2)
echo "Installing AWS CLI..."
curl -LO "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verify AWS CLI installation
echo "Verifying AWS CLI version..."
aws --version
# Install Docker
echo "Installing Docker..."
sudo yum install docker -y
sudo systemctl start docker

# Install kubectl
echo "Installing kubectl..."
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install kops
echo "Installing kops..."
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64

# Move kops to /usr/local/bin and rename it to 'kops' (no suffix)
sudo mv kops-linux-amd64 /usr/local/bin/kops

# Ensure it's executable
sudo chmod +x /usr/local/bin/kops

# Set the kops path (optional, but recommended)
echo "Setting the kops path (optional)..."
export PATH=$PATH:/usr/local/bin/

# Source ~/.bashrc to ensure the changes take effect
source ~/.bashrc

# Verify installations
echo "Verifying installations..."
kubectl version
kops version

