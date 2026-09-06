# Deployment Guide

## Prerequisites
- Azure CLI
- Terraform >= 1.6
- Kubectl
- Ansible
- .NET 8 SDK

## Step 1: Deploy Infrastructure
cd infrastructure/terraform/environments/dev
terraform init
terraform apply

## Step 2: Configure Cluster
cd ~/aks/ansible
ansible-playbook playbooks/00-optimize-resources.yml
ansible-playbook playbooks/01-install-istio.yml
ansible-playbook playbooks/02-install-monitoring.yml
ansible-playbook playbooks/03-deploy-apps.yml

## Step 3: Verify
kubectl get pods -n rework
kubectl get services -n rework

## Step 4: Access
istioctl dashboard kiali
kubectl port-forward -n monitoring svc/grafana 3000:80

## Canary Deployment
ansible-playbook playbooks/progressive-canary2.yml \
  -e "service=admin-api" \
  -e "image_repository=administration-api" \
  -e "image_tag=latest"

## Rollback
kubectl rollout undo deployment/admin-api -n rework
