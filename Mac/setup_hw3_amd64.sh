#!/usr/bin/env bash
set -ex 

# Docker installation from https://docs.docker.com/desktop/install/mac-install/

echo "Updating Homebrew..."
brew update
# Install Docker Desktop
brew install --cask docker

# Start Docker Desktop
open /Applications/Docker.app


# Kubectl installation from https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

kubectl version --client

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

echo "Setup for HW3 complete, you can now continue with Part 1.1"