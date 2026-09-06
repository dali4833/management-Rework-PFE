#!/bin/bash

# Check if README.md exists
if [ ! -f "README.md" ]; then
    echo "❌ README.md not found!"
    exit 1
fi

# Check if pipeline section already exists
if grep -q "## 🔵 Azure DevOps Pipeline" README.md; then
    echo "✅ Pipeline section already exists in README.md"
    exit 0
fi

# Create a temporary file with the pipeline section
cat > pipeline-section.txt << 'PIPELINE'

## 🔵 Azure DevOps Pipeline

### Pipeline Overview
![Pipeline Overview](docs/screenshots/azure-devops/pipeline-overview.png)

*Complete CI/CD pipeline with 5 automated stages: Build → Quality → AI Coverage → Security → Deploy*

---

### Stage 1: Build & Test
![Build Stage](docs/screenshots/azure-devops/pipeline-build.png)

*.NET restore, build, unit tests, and code coverage generation*

---

### Stage 2: Code Quality (SonarCloud)
![SonarCloud](docs/screenshots/azure-devops/pipeline-sonarcloud.png)

*SonarCloud quality gate with security rating enforcement (A-E)*

---

### Stage 3: AI Coverage Report → Slack
![AI Coverage](docs/screenshots/azure-devops/pipeline-ai-coverage.png)

*AI analyzes coverage and sends actionable insights to Slack*

---

### Stage 4: Container & AI Security
![Security](docs/screenshots/azure-devops/pipeline-security.png)

*Trivy vulnerability scan with Ollama AI analysis. Blocks if Critical/High found*

---

### Stage 5: Deploy to AKS
![Deploy](docs/screenshots/azure-devops/pipeline-deploy.png)

*Canary deployment to Azure Kubernetes Service*

---

### Canary Rollout
![Rollout](docs/screenshots/azure-devops/pipeline-rollout.png)

*Progressive canary: 10% → 50% → 100% with auto-rollback*

---

PIPELINE

# Insert the pipeline section after "## 📸 Screenshots" and before "## 📊 Grafana Monitoring"
if grep -q "## 📸 Screenshots" README.md && grep -q "## 📊 Grafana Monitoring" README.md; then
    # Find the line number of Grafana section
    GRAFANA_LINE=$(grep -n "## 📊 Grafana Monitoring" README.md | cut -d: -f1)
    
    # Insert pipeline section before Grafana section
    head -n $((GRAFANA_LINE - 1)) README.md > README.tmp
    cat pipeline-section.txt >> README.tmp
    tail -n +$GRAFANA_LINE README.md >> README.tmp
    
    mv README.tmp README.md
    echo "✅ Pipeline section added to README.md"
elif grep -q "## 📸 Screenshots" README.md; then
    # If no Grafana section, add after Screenshots
    SCREENSHOTS_LINE=$(grep -n "## 📸 Screenshots" README.md | cut -d: -f1)
    head -n $SCREENSHOTS_LINE README.md > README.tmp
    cat pipeline-section.txt >> README.tmp
    tail -n +$((SCREENSHOTS_LINE + 1)) README.md >> README.tmp
    
    mv README.tmp README.md
    echo "✅ Pipeline section added after Screenshots"
else
    # If no Screenshots section, add at the end
    cat README.md pipeline-section.txt > README.tmp
    mv README.tmp README.md
    echo "✅ Pipeline section added at the end"
fi

# Clean up
rm -f pipeline-section.txt

# Show the updated README
echo ""
echo "📝 Updated README.md:"
echo "----------------------------------------"
head -n 30 README.md
echo "..."
echo "----------------------------------------"
echo ""
echo "🚀 Done! Now commit and push:"
echo "  git add README.md"
echo "  git commit -m '🔵 Added Azure DevOps Pipeline section'"
echo "  git push"
