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

![Architecture Overview](docs/screenshots/architecture/architecture-overview.gif)

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

## 🔵 Azure DevOps Pipeline

### Pipeline Overview
![Pipeline Overview](docs/screenshots/azure-devops/pipeline-overview.png)

*Complete CI/CD pipeline with 5 automated stages: Build → Quality → AI Coverage → Security → Deploy*

### Stage 1: Build & Test
![Build Stage](docs/screenshots/azure-devops/pipeline-build.png)

*.NET restore, build, unit tests, and code coverage generation*

### Stage 2: Code Quality (SonarCloud)
![SonarCloud](docs/screenshots/azure-devops/pipeline-sonarcloud.png)

*SonarCloud quality gate with security rating enforcement (A-E)*

### Stage 3: AI Coverage Report → Slack
![AI Coverage](docs/screenshots/azure-devops/pipeline-ai-coverage.png)

*AI analyzes coverage and sends actionable insights to Slack*

### Stage 4: Container & AI Security
![Security](docs/screenshots/azure-devops/pipeline-security.png)

*Trivy vulnerability scan with Ollama AI analysis. Blocks if Critical/High found*

### Stage 5: Deploy to AKS
![Deploy](docs/screenshots/azure-devops/pipeline-deploy.png)

*Canary deployment to Azure Kubernetes Service*

### Canary Rollout
![Rollout](docs/screenshots/azure-devops/pipeline-rollout.png)

*Progressive canary: 10% → 50% → 100% with auto-rollback*

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

## 🚀 Canary Rollback in Action (Live Capture)

### 📊 Grafana Detection - Rollback Analysis

![Canary Rollback Analysis](docs/screenshots/monitoring/grafana-rollout-metrics.png)

*Figure: admin-api canary rollout automatically detected a regression and rolled back — captured live from the Grafana dashboard.*

---

### 📊 Traffic Split (v1 vs v2)

![Traffic Split](docs/screenshots/monitoring/grafana-traffic-split.png)

*Figure: Admin API canary deployment showing gradual traffic migration from v1 (stable) to v2 (canary)*

| Phase | v1 Traffic | v2 Traffic | Status |
|-------|------------|------------|--------|
| **Start** | ~6 req/s | 0 req/s | 🔵 100% v1 |
| **Canary (10%)** | ~5.4 req/s | ~0.6 req/s | 🟢 Testing |
| **Half (50%)** | ~3 req/s | ~3 req/s | 🟢 50/50 split |
| **Full** | 0 req/s | ~6 req/s | 🟢 100% v2 |

---

### 📊 Interactive HTML Chart

[![Rollout Metrics Chart](docs/screenshots/monitoring/grafana-rollback-analysis.png)](https://dali4833.github.io/management-Rework-PFE/docs/rollouts-metrics.html)

*Click the image to open the interactive chart in your browser*

---

**Timeline breakdown:**

| Interval | Time range | Duration | What's happening |
|----------|------------|----------|-------------------|
| 🔘 Baseline | 19:52:00 – 19:53:15 | 75s | v1 handles 100% of traffic, canary idle at near-zero |
| 🟠 Ramp-up | 19:53:15 – 19:54:00 | 45s | Controller shifts weight from v1 to v2, 0% → 50% |
| 🔵 Steady 50/50 | 19:54:00 – 19:55:45 | 105s | Split holds evenly (3.02 vs 3.04 req/s) while analysis runs |
| 🔴 Rollback | 19:55:45 – 19:56:30 | 45s | Analysis fails a check, controller reverts weight, 50% → 0% |
| 🔘 Recovered | 19:56:30 onward | — | v1 back to 100% of traffic, canary fully drained |

Total request volume stayed constant (~6.2 req/s) throughout — the pipeline shifted *routing weight*, not overall load, confirming the split was managed cleanly by the mesh rather than causing any user-facing disruption.

The canary's automated analysis step flagged a regression during the steady-state window and triggered a rollback, restoring 100% of traffic to the stable version with zero downtime. This demonstrates the full progressive-delivery loop working end-to-end: **deploy → analyze → detect → rollback**, without manual intervention.

---

## 🚀 Quick Start

\`\`\`bash
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
\`\`\`

---

## 📚 Documentation

- [Architecture Deep Dive](docs/architecture.md)
- [Deployment Guide](docs/deployment.md)

---

## 👨‍💻 Author

**Mohamed Ali**

- 📧 Email: your.email@example.com
- 🔗 LinkedIn: linkedin.com/in/your-profile
- 🐙 GitHub: [dali4833](https://github.com/dali4833)

PFE Project 2025-2026

---

## 📝 License

MIT License - see LICENSE

---

⭐ If you find this useful, please give it a star!
