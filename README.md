# 🚀 Management.Rework - PFE Project

## 🎓 Projet de Fin d'Études (PFE) 2025-2026

**Cloud-Native Microservices Platform with AI-Powered DevOps**

![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-Pipeline-0078D7)
![AKS](https://img.shields.io/badge/AKS-Kubernetes-326CE5)
![Istio](https://img.shields.io/badge/Istio-Service%20Mesh-466BB0)
![SonarCloud](https://img.shields.io/badge/SonarCloud-Quality%20Gate-FD3456)

---

## 📋 Overview

**Management.Rework** is a production-grade microservices platform built as my final year engineering project.

### Key Features

- ✅ **Infrastructure as Code** (Terraform) on Azure
- ✅ **CI/CD Pipeline** with 5 automated stages
- ✅ **Service Mesh** (Istio) with Kiali visualization
- ✅ **AI-Powered Operations** (Ollama + Mistral)
- ✅ **Shift-Left Security** (Trivy + SonarCloud)
- ✅ **Canary Deployments** (10% → 50% → 100%)
- ✅ **Full Observability** (Prometheus + Grafana)

---

## 🏗️ Architecture

![Architecture](docs/screenshots/architecture/architecture-overview.png)

### Microservices

| Service | Description |
|---------|-------------|
| **API Gateway** | Entry point, routing |
| **Admin API** | Administration management |
| **Auth API** | Authentication & Authorization |
| **Products API** | Product management |
| **Intervention API** | Business logic |

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| **Cloud** | Azure (AKS, ACR, MySQL, Key Vault) |
| **IaC** | Terraform, Ansible |
| **CI/CD** | Azure DevOps + WSL2 Agent |
| **Container** | Docker, Kubernetes |
| **Service Mesh** | Istio, Kiali |
| **Security** | Trivy, SonarCloud |
| **AI** | Ollama, Mistral 7B |
| **Monitoring** | Prometheus, Grafana |

---

## 📸 Screenshots

### AKS Cluster

![AKS Cluster](docs/screenshots/aks/cluster-full-view.png)

### Kiali Service Mesh Dashboard

![Kiali Overview](docs/screenshots/kiali/kiali-overview.png)

### Kiali Service Graph

![Kiali Service Graph](docs/screenshots/kiali/kiali-service-graph.png)

### Istio VirtualServices & DestinationRules

![Istio VS](docs/screenshots/istio/istio-vs-ds.png)

---

## 📊 Grafana Monitoring

### Node Exporter Dashboard

![Grafana Nodes](docs/screenshots/monitoring/grafana-nodes.png)

*Figure: Node metrics showing CPU, Memory, Disk, and Network usage*

### Monitoring Stack

- **Prometheus**: Metrics collection
- **Grafana**: Dashboards and visualization
- **Node Exporter**: Node metrics

---

## 🚀 Quick Start

```bash
# Clone
git clone https://github.com/dali4833/management-Rework-PFE.git
cd management-Rework-PFE

# Deploy Infrastructure
cd infrastructure/terraform/environments/dev
terraform init
terraform apply

# Deploy Applications
cd ~/aks/ansible
ansible-playbook playbooks/03-deploy-apps.yml
