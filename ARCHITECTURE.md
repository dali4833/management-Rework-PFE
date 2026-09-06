# Architecture Deep Dive

## Microservices
- API Gateway: Entry point, routing
- Admin API: Administration with MediatR
- Auth API: JWT authentication
- Products API: Product management
- Intervention API: Business logic

## Infrastructure (Azure)
- AKS Cluster: Kubernetes orchestration
- ACR: Container registry
- MySQL Flexible Server: 5 logical databases
- Key Vault: Secrets management
- VNet: Network isolation (10.0.0.0/16)

## Service Mesh (Istio)
- Traffic management with Virtual Services
- mTLS security
- Kiali for visualization
- Circuit breakers and retries

## CI/CD Pipeline (5 Stages)
1. Build & Test: .NET restore, build, test
2. Code Quality: SonarCloud analysis
3. AI Coverage: AI analysis -> Slack
4. Security: Trivy vulnerability scan
5. Deploy: Canary to AKS

## Observability
- Prometheus: Metrics
- Grafana: Dashboards
- Kiali: Service mesh visualization

## Security
- Shift-Left: Scan in CI
- Quality Gates: Coverage > 80%
- Container Scan: Trivy
- Secrets: Key Vault with Managed Identity

## Deployment Strategy
Canary: 10% -> 50% -> 100% with auto-rollback
