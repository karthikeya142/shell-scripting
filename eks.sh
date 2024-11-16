# Install Docker
echo "Installing Docker..."
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Install AWS CLI (latest version)
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip

# Install kubectl (latest stable version)
echo "Installing kubectl..."
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install eksctl (latest version)
echo "Installing eksctl..."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.138.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin/

# Ensure all tools are executable
sudo chmod +x /usr/local/bin/eksctl

# Set the path for eksctl (optional, but recommended)
echo "Setting the eksctl path (optional)..."
export PATH=$PATH:/usr/local/bin/

# Source ~/.bashrc to ensure the changes take effect
source ~/.bashrc

# Verify installations
echo "Verifying installations..."
aws --version
kubectl version --client
eksctl version
