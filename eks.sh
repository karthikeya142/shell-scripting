# Install AWS CLI (latest version)
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip

# Install Docker
echo "Installing Docker..."
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Install kubectl
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl

# Make kubectl executable
chmod +x kubectl

# Move kubectl to /usr/local/bin
sudo mv kubectl /usr/local/bin/

# Verify kubectl version
kubectl version --client

# Verify eksctl version
eksctl version
