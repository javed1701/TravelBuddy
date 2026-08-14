# ✈️ TravelBuddy – End-to-End DevSecOps CI/CD Pipeline

## In this project, we build a complete production-ready **DevSecOps + GitOps** platform on AWS using modern cloud-native tools. The infrastructure is provisioned using Terraform, the CI pipeline is automated with Jenkins, security is integrated using OWASP Dependency Check, SonarQube, and Trivy, and the application is deployed to Amazon EKS using Argo CD. The platform also includes monitoring with Prometheus and Grafana.

---

## 🚀 Project Deployment Flow

<p align="center">
  <img src="/Images/TravelBuddy_Workflow.png" width="100%" alt="Workflow">
</p>

---

## 🏗️ Infrastructure Architecture

<p align="center">
  <img src="/Images/TravelBuddy Architecture.png" width="100%" alt="Architecture">
</p>

---

# 🛠️ Tech Stack Used

## 🚀 Core DevSecOps Stack

- GitHub (Source Code Management)
- Terraform (Infrastructure as Code)
- Jenkins (Continuous Integration)
- Docker (Containerization)
- Docker Hub (Container Registry)
- Argo CD (GitOps Continuous Deployment)

---

## 🔐 Security & Code Quality

- OWASP Dependency Check
- SonarQube
- Trivy

---

## ☸️ Cloud & Kubernetes

- AWS VPC
- Amazon EC2
- Amazon EKS
- Kubernetes
- AWS Application Load Balancer
- Helm
- Redis

---

## 📊 Monitoring & Observability

- Prometheus
- Grafana

---

# 🔄 DevSecOps CI/CD Workflow

## 🔹 CI Pipeline (Jenkins)

- Source Code Checkout
- Install Project Dependencies
- OWASP Dependency Check
- SonarQube Static Code Analysis
- Docker Image Build
- Trivy Image Scan
- Push Docker Image to Docker Hub
- Update GitOps Repository

---

## 🚀 CD Pipeline (GitOps)

- Detect Changes in GitOps Repository
- Argo CD Auto Sync
- Deploy Updated Image to Amazon EKS
- Rolling Update Deployment
- Zero Downtime Deployment

---

# ✨ Key Features

- ✅ Infrastructure as Code using Terraform
- ✅ Automated CI/CD Pipeline
- ✅ DevSecOps Security Integration
- ✅ Static Code Analysis
- ✅ Dependency Vulnerability Scanning
- ✅ Container Image Security Scanning
- ✅ Docker Hub Integration
- ✅ GitOps Deployment using Argo CD
- ✅ Kubernetes Rolling Updates
- ✅ AWS Application Load Balancer
- ✅ Monitoring with Prometheus & Grafana
- ✅ Secure AWS Networking
- ✅ Infrastructure Modularization
- ✅ End-to-End Automation

---

# 📈 Project Workflow After Deployment

- ✅ Developer pushes code to GitHub
- ✅ Jenkins automatically starts the CI Pipeline
- ✅ Security & Quality checks are executed
- ✅ Docker image is built and pushed to Docker Hub
- ✅ Jenkins updates Kubernetes manifests in the GitOps repository
- ✅ Argo CD detects repository changes
- ✅ Application is automatically deployed to Amazon EKS
- ✅ Application becomes available through AWS Application Load Balancer
- ✅ Prometheus collects metrics
- ✅ Grafana visualizes dashboards

---

# 📚 Project Sections

| Section | Description |
|---------|-------------|
| Infrastructure | AWS infrastructure provisioning using Terraform |
| Jenkins | Continuous Integration Pipeline |
| SonarQube | Static Code Analysis |
| OWASP | Dependency Vulnerability Scanning |
| Trivy | Container Image Security |
| Docker | Build & Push Images |
| Docker Hub | Image Repository |
| Amazon EKS | Kubernetes Cluster |
| Argo CD | GitOps Continuous Deployment |
| Prometheus | Metrics Collection |
| Grafana | Monitoring Dashboards |

---

# 📋 Prerequisites

Before deploying this project, ensure you have:

- AWS Account
- IAM User with Administrator Access
- AWS CLI
- Terraform (>= 1.5)
- Git
- Docker
- kubectl
- Helm
- eksctl
- EC2 Key Pair
- GitHub Account
- Docker Hub Account

---

# 🚀 Getting Started

The following sections explain how to deploy the project from scratch:

- Clone Repository
- Configure AWS Credentials
- Create EC2 Key Pair
- Update Terraform Variables
- Deploy Infrastructure
- Access Jenkins
- Configure SonarQube
- Configure kubectl
- Install Argo CD
- Deploy Monitoring
- Configure Jenkins Pipelines
- Deploy TravelBuddy Application

---

# 📸 Screenshots

- Infrastructure Architecture
- DevSecOps Workflow
- Terraform Apply
- Jenkins Dashboard
- SonarQube Dashboard
- Docker Hub Repository
- Amazon EKS Cluster
- Argo CD Dashboard
- Kubernetes Pods
- Prometheus Dashboard
- Grafana Dashboard
- TravelBuddy Application

---

# 👨‍💻 Author

**Amar Karande**

**TravelBuddy – End-to-End DevSecOps CI/CD Pipeline**

---

# 🚀 Infrastructure Deployment using Terraform

Follow the steps below to provision the complete AWS infrastructure.

---

## 📥 Step 1: Clone the Repository

```bash
https://github.com/AmarKarande/TravelBuddy-Terraform.git
cd TravelBuddy
```

---

## 📂 Repository Structure

```text
TravelBuddy/
│
├── modules/
│   ├── alb/
│   ├── eks/
│   ├── iam/
│   ├── jenkins/
│   ├── security-groups/
│   ├── sonarqube/
│   └── vpc/
│
├── scripts/
│
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── variables.tf
├── versions.tf
├── terraform.tfvars.example
├── .gitignore
│
├── travel-architecture.png
├── travel-workflow.png
│
└── README.md
```

---

# 🔧 Step 2: Install Required Tools

Install the following:

- Terraform
- AWS CLI
- Git
- kubectl
- Helm

Verify installation

```bash
terraform version
aws --version
kubectl version --client
helm version
git --version
```

---

# ☁️ Step 3: Configure AWS

Configure AWS CLI.

```bash
aws configure
```

Verify credentials.

```bash
aws sts get-caller-identity
```

---

# 🔑 Step 4: Create an EC2 Key Pair

Create a Key Pair from the AWS Console.

```
AWS Console
    ↓
EC2
    ↓
Key Pairs
    ↓
Create Key Pair
```

Example

```
travelbuddy-key
```

Download the **.pem** file and keep it safe.

> **Note:** Never upload your `.pem` file to GitHub.

---

# ⚙️ Step 5: Configure Terraform Variables

Copy the example file.

```bash
cp terraform.tfvars.example terraform.tfvars
```

Update the values.

Example

```hcl
aws_region   = "eu-north-1"
project_name = "travelbuddy"

key_name      = "travelbuddy-key"
instance_type = "t3.large"
```

---

# 🚀 Step 6: Initialize Terraform

```bash
terraform init
```

Terraform downloads all required providers and modules.

---

# ✅ Step 7: Validate Configuration

```bash
terraform validate
```

---

# 📋 Step 8: Review Execution Plan

```bash
terraform plan
```

Review all resources before deployment.

---

# ☁️ Step 9: Deploy Infrastructure

```bash
terraform apply
```

Confirm deployment.

```
yes
```

Terraform provisions:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM Roles
- Jenkins EC2
- SonarQube EC2
- Amazon EKS Cluster
- Managed Node Group
- Application Load Balancer

---

# 📤 Step 10: Verify Outputs

```bash
terraform output
```

Example outputs

- Jenkins Public IP
- SonarQube Private IP
- EKS Cluster Name
- ALB DNS Name
- VPC ID
- Public Subnets
- Private Subnets

---

# 🔑 Step 11: Access Jenkins

SSH into the Jenkins server.

```bash
ssh -i travelbuddy-key.pem admin@<JENKINS_PUBLIC_IP>
```

Open Jenkins.

```
http://<JENKINS_PUBLIC_IP>:8080
```

Retrieve the initial password.

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

# 🔒 Step 12: Access SonarQube

SonarQube is deployed inside a **private subnet**.

Access options:

- SSH from Jenkins EC2
- AWS Systems Manager (SSM)
- VPN (optional)

---

# ☸️ Step 13: Configure kubectl

Connect to the EKS cluster.

```bash
aws eks update-kubeconfig \
--region eu-north-1 \
--name travelbuddy-cluster
```

Verify.

```bash
kubectl get nodes
```

Expected

```
Ready
Ready
```

---

# 📦 Step 14: Deploy the Application

```bash
kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml
```

Verify deployment.

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

# 🧹 Step 15: Destroy Infrastructure

To avoid AWS charges.

```bash
terraform destroy
```

Confirm.

```
yes
```

Terraform removes all AWS resources created by this project.

---

> **Note**
>
> Always use Terraform to create, update, or destroy infrastructure. Avoid making manual changes in the AWS Console, as they can cause Terraform state drift.


# ⚙️ Jenkins Server Setup

After provisioning the infrastructure using Terraform, connect to the Jenkins EC2 instance.

```bash
ssh -i <your-key>.pem admin@<JENKINS_PUBLIC_IP>
```

---

## Install Java

```bash
sudo apt update

sudo apt install -y fontconfig openjdk-21-jre

java -version
```

---

## Install Docker

```bash
sudo apt install -y docker.io

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker jenkins

sudo usermod -aG docker $USER
```

---

## Install Jenkins

```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install -y jenkins

sudo systemctl enable jenkins

sudo systemctl start jenkins
```

Verify Jenkins

```
http://<JENKINS_PUBLIC_IP>:8080
```

Retrieve the initial admin password.

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

# 🔒 Install Trivy

```bash
sudo apt install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -

echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list

sudo apt update

sudo apt install trivy -y
```

Verify

```bash
trivy --version
```

---

# 📊 SonarQube Server

SSH into the SonarQube EC2 instance.

```bash
ssh -i <your-key>.pem admin@<SONAR_PRIVATE_IP>
```

Install SonarQube by following the setup instructions included in this repository.

---

# 🔌 Install Jenkins Plugins

Navigate to:

```
Manage Jenkins
    ↓
Plugins
    ↓
Available Plugins
```

Install:

- OWASP Dependency Check
- SonarQube Scanner
- Docker Pipeline
- Eclipse Temurin Installer
- Email Extension Plugin

Restart Jenkins.

```bash
sudo systemctl restart jenkins
```

---

# 🔑 Configure Jenkins Credentials

Navigate to:

```
Manage Jenkins
    ↓
Credentials
```

Add the following credentials.

| Credential ID | Type |
|--------------|------|
| github-creds | Username with Password / PAT |
| dockerhub-creds | Username with Password |
| sonar-token | Secret Text |
| nvd-api-key | Secret Text |
| react-app-env | Secret Text |
| google-maps-key | Secret Text |
| rapidapi-key | Secret Text |
| openweather-key | Secret Text |
| gemini-key | Secret Text |

> **Important:** Replace all values with your own credentials. Never commit tokens or API keys to GitHub.

---

# 🔧 Configure Jenkins Tools

Navigate to:

```
Manage Jenkins
    ↓
Tools
```

Configure the following tools.

### OWASP Dependency Check

Name

```
DP-Check
```

Install automatically using the latest GitHub release.

---

### SonarQube Scanner

Name

```
sonar-scanner
```

Install automatically.

---

# 🔗 Configure SonarQube Webhook

Navigate to:

```
Administration
    ↓
Configuration
    ↓
Webhooks
```

Add:

```
http://<JENKINS_PUBLIC_IP>:8080/sonarqube-webhook/
```

---

# 🚀 Configure CD Pipeline

Create a new Jenkins Pipeline job.

Connect it to your GitOps GitHub repository.

---

# 📦 Install yq

SSH into the Jenkins server.

```bash
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
-O /usr/local/bin/yq

sudo chmod +x /usr/local/bin/yq

yq --version
```

Restart Jenkins.

```bash
sudo systemctl restart jenkins
```

---

# ✅ Verification Checklist

- Jenkins is accessible.
- Docker is running.
- Trivy is installed.
- SonarQube Scanner is configured.
- OWASP Dependency Check is configured.
- All Jenkins credentials are added.
- SonarQube webhook is configured.
- `yq` is installed.
- Jenkins is ready to execute the CI/CD pipeline.


# 📊 SonarQube Server Setup

SonarQube is deployed on a separate EC2 instance inside the **private subnet** for enhanced security.

---

## Step 1: Connect to the SonarQube Server

```bash
ssh -i <your-key>.pem admin@<SONAR_PRIVATE_IP>
```

---

## Step 2: Install Docker

```bash
sudo apt update -y

sudo apt install -y docker.io

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker $USER
```

Reconnect to the server or run:

```bash
newgrp docker
```

Verify the installation:

```bash
docker --version

docker ps
```

---

## Step 3: Pull the SonarQube Docker Image

```bash
docker pull sonarqube:lts-community
```

---

## Step 4: Run the SonarQube Container

```bash
docker run -d \
  --name sonarqube \
  --restart unless-stopped \
  -p 9000:9000 \
  sonarqube:lts-community
```

Verify that the container is running:

```bash
docker ps
```

---

# 🌐 Access SonarQube from Your Local Machine

Since SonarQube is hosted in a **private subnet**, create an SSH tunnel through the Jenkins EC2 instance.

## Option 1: Linux / macOS

```bash
ssh -i <your-key>.pem \
-L 9000:<SONAR_PRIVATE_IP>:9000 \
admin@<JENKINS_PUBLIC_IP>
```

Keep the SSH session open.

Open your browser:

```
http://localhost:9000
```

---

## Option 2: Windows (PuTTY)

### Convert the Key

1. Open **PuTTYgen**
2. Load your `.pem` file
3. Save it as a `.ppk` file

---

### Configure PuTTY

**Session**

```
Host Name:
<JENKINS_PUBLIC_IP>

Port:
22
```

---

### Authentication

```
Connection
    ↓
SSH
    ↓
Credentials
```

Select your `.ppk` file.

---

### Configure the Tunnel

```
Connection
    ↓
SSH
    ↓
Tunnels
```

```
Source Port

9000
```

```
Destination

<SONAR_PRIVATE_IP>:9000
```

Select:

- Local

Click **Add**

Save the session and click **Open**.

Keep the PuTTY window open.

Open:

```
http://localhost:9000
```

---

# 🔑 Login to SonarQube

Default credentials:

```
Username

admin
```

```
Password

admin
```

SonarQube will prompt you to change the password after the first login.

---

# 🔐 Generate a SonarQube Token

Navigate to:

```
User
    ↓
My Account
    ↓
Security
    ↓
Generate Token
```

Example:

```
Name

jenkins-token
```

Copy the generated token.

> **Important:** Do not commit this token to GitHub. Store it securely in Jenkins Credentials.

---

# 🔧 Configure SonarQube Server in Jenkins

Navigate to:

```
Manage Jenkins
    ↓
System
    ↓
SonarQube Servers
```

Configuration:

```
Name

sonarqube
```

```
Server URL

http://<SONAR_PRIVATE_IP>:9000
```

Authentication:

```
sonar-token
```

> **Note:** Jenkins should communicate with SonarQube using its **private IP address**. The SSH tunnel (`http://localhost:9000`) is only for accessing the SonarQube web interface from your local machine.

---

# 📦 Install SonarQube Scanner

Navigate to:

```
Manage Jenkins
    ↓
Tools
    ↓
SonarQube Scanner
```

Configuration:

```
Name

sonar-scanner
```

Enable:

```
✔ Install Automatically
```

---

# ✅ Verification Checklist

- Docker installed
- SonarQube container running
- SonarQube accessible through SSH tunnel
- SonarQube token generated
- SonarQube server configured in Jenkins
- SonarQube Scanner installed
- Jenkins successfully connects to SonarQube


# ☸️ Amazon EKS Setup

The Amazon EKS cluster hosts all Kubernetes workloads required for the TravelBuddy application.

---

## Kubernetes Components

The following components run inside the EKS cluster.

| Component | Purpose |
|----------|---------|
| Argo CD | GitOps Continuous Deployment |
| TravelBuddy Application | Frontend, Backend & Redis |
| AWS Load Balancer Controller | Creates and manages the AWS Application Load Balancer |
| Prometheus | Collects cluster and application metrics |
| Grafana | Visualizes metrics and dashboards |
| CoreDNS | Internal Kubernetes DNS |
| kube-proxy | Kubernetes Networking |
| aws-node (VPC CNI) | AWS Networking for Kubernetes |

---

# Install Helm

Download and install Helm.

```bash
curl -fsSL -o get_helm.sh \
https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh
```

Verify installation.

```bash
helm version
```

---

# Install Argo CD

Create the namespace.

```bash
kubectl create namespace argocd
```

Install Argo CD.

```bash
kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verify the pods.

```bash
kubectl get pods -n argocd -w
```

---

# Retrieve the Initial Argo CD Password

```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
-o jsonpath="{.data.password}" | base64 -d
```

Store this password securely.

---

# Access Argo CD

For local access, create a port-forward.

```bash
kubectl port-forward svc/argocd-server \
-n argocd \
8080:443
```

Open your browser.

```
https://localhost:8080
```

Default credentials:

```
Username

admin
```

```
Password

<Initial Password Retrieved Above>
```

---

# Deploy the TravelBuddy Application

Create a namespace.

```bash
kubectl create namespace travelbuddy
```

Clone the GitOps repository.

```bash
git clone https://github.com/<your-username>/travel-buddy-gitops.git
```

Deploy the Argo CD Application.

```bash
kubectl apply -f argocd-app.yaml
```

Verify.

```bash
kubectl get applications -n argocd
```

Check application status.

```bash
kubectl get application travel-buddy -n argocd
```

---

# Verify Deployment

Check the running pods.

```bash
kubectl get pods -n travelbuddy
```

Check services.

```bash
kubectl get svc -n travelbuddy
```

Check ingress.

```bash
kubectl get ingress -n travelbuddy
```

---

# Verify the AWS Load Balancer

List the created Application Load Balancers.

```bash
aws elbv2 describe-load-balancers \
--query "LoadBalancers[*].[LoadBalancerName,DNSName]" \
--output table
```

The command returns the ALB DNS name.

Open the DNS name in your browser to access the TravelBuddy application.

---

# Verify Argo CD Sync

Ensure the application status is:

- Synced
- Healthy

Verify using:

```bash
kubectl get application travel-buddy -n argocd
```

---

# Deployment Flow

```text
Developer
      │
      ▼
GitHub Repository
      │
      ▼
Jenkins CI Pipeline
      │
      ▼
Docker Hub
      │
      ▼
GitOps Repository
      │
      ▼
Argo CD
      │
      ▼
Amazon EKS
      │
      ▼
AWS Application Load Balancer
      │
      ▼
Users
```

---

# Verification Checklist

- Helm Installed
- Argo CD Installed
- Argo CD Pods Running
- GitOps Repository Connected
- Application Synced
- Pods Running
- Services Created
- Ingress Created
- AWS Load Balancer Created
- Application Accessible

# 📊 Monitoring Setup (Prometheus & Grafana)

The monitoring stack is deployed using the **kube-prometheus-stack Helm Chart**, which installs:

- Prometheus
- Grafana
- AlertManager
- Node Exporter
- kube-state-metrics

---

# Install Helm

```bash
curl -fsSL -o get_helm.sh \
https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh
```

Verify installation.

```bash
helm version
```

---

# Add the Prometheus Helm Repository

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

---

# Create Monitoring Namespace

```bash
kubectl create namespace monitoring
```

---

# Install Prometheus & Grafana

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring
```

---

# Verify Installation

Check all monitoring pods.

```bash
kubectl get pods -n monitoring
```

---

# Retrieve Grafana Admin Password

```bash
kubectl get secret monitoring-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```

Default username:

```
admin
```

Store the password securely.

---

# Access Grafana (Development)

Port-forward the Grafana service.

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-grafana \
3000:80
```

Open:

```
http://localhost:3000
```

---

# Access Prometheus (Development)

Port-forward Prometheus.

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-kube-prometheus-prometheus \
9090:9090
```

Open:

```
http://localhost:9090
```

Prometheus does not require authentication by default.

---

# Verify Monitoring Services

List all monitoring services.

```bash
kubectl get svc -n monitoring
```

---

# Optional: Expose Grafana Using a LoadBalancer

For demonstration purposes, Grafana can be exposed externally.

```bash
kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"LoadBalancer"}}'
```

Verify:

```bash
kubectl get svc monitoring-grafana -n monitoring
```

---

# Optional: Expose Prometheus Using a LoadBalancer

```bash
kubectl patch svc monitoring-kube-prometheus-prometheus \
-n monitoring \
-p '{"spec":{"type":"LoadBalancer"}}'
```

Verify:

```bash
kubectl get svc monitoring-kube-prometheus-prometheus -n monitoring
```

---

# Recommended Production Configuration

For production environments, avoid exposing internal services directly to the internet.

Recommended service types:

| Service | Type |
|---------|------|
| TravelBuddy Application | Application Load Balancer (ALB) |
| Grafana | ClusterIP + Ingress |
| Argo CD | ClusterIP + Ingress |
| Prometheus | ClusterIP |

Convert Grafana back to ClusterIP:

```bash
kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"ClusterIP"}}'
```

Convert Prometheus back to ClusterIP:

```bash
kubectl patch svc monitoring-kube-prometheus-prometheus \
-n monitoring \
-p '{"spec":{"type":"ClusterIP"}}'
```

Convert Argo CD back to ClusterIP:

```bash
kubectl patch svc argocd-server \
-n argocd \
-p '{"spec":{"type":"ClusterIP"}}'
```

---

# Access Services from Your Local Machine

Update your kubeconfig.

```bash
aws eks update-kubeconfig \
--region <AWS_REGION> \
--name travelbuddy-cluster
```

Use port forwarding to access the services locally.

### Argo CD

```bash
kubectl port-forward \
-n argocd \
svc/argocd-server \
8080:443
```

Open:

```
https://localhost:8080
```

---

### Grafana

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-grafana \
3000:80
```

Open:

```
http://localhost:3000
```

---

### Prometheus

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-kube-prometheus-prometheus \
9090:9090
```

Open:

```
http://localhost:9090
```

---

# Production Architecture

```text
                   Internet
                       │
                       ▼
             AWS Application Load Balancer
                       │
        ┌──────────────┴──────────────┐
        │                             │
        ▼                             ▼
 TravelBuddy Application       Grafana / Argo CD
        │                             │
        └──────────────┬──────────────┘
                       ▼
                Amazon EKS Cluster
                       │
       ┌───────────────┼────────────────┐
       │               │                │
       ▼               ▼                ▼
  TravelBuddy      Prometheus      Grafana
  Application
```

> **Note:** Prometheus is typically kept internal and accessed only by Grafana or cluster administrators.

---

# Verification Checklist

- ✅ Helm Installed
- ✅ Monitoring Namespace Created
- ✅ Prometheus Running
- ✅ Grafana Running
- ✅ AlertManager Running
- ✅ Node Exporter Running
- ✅ Dashboards Accessible
- ✅ Metrics Being Collected


You can view the installed Grafana dashboards from either the UI or the Kubernetes side.

Option 1: From the Grafana UI (Recommended)

If Grafana is running:

kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80

Open:

http://localhost:3000

Login:

Username: admin
Password:
kubectl get secret -n monitoring monitoring-grafana \
-o jsonpath="{.data.admin-password}" | base64 --decode

Then navigate to:

Dashboards
   ↓
Browse

or

Dashboards
   ↓
Manage

You should see dashboards such as:

Kubernetes / Compute Resources / Cluster
Kubernetes / Compute Resources / Namespace (Pods)
Kubernetes / Compute Resources / Node
Kubernetes / Compute Resources / Pod
Kubernetes / Networking
Kubernetes / API Server
Prometheus 2.0 Stats
Alertmanager
CoreDNS
Option 2: List dashboard ConfigMaps

Run:

kubectl get configmaps -n monitoring

To see only dashboard ConfigMaps:

kubectl get configmaps -n monitoring | grep dashboard
Option 3: Check Grafana sidecar logs

If dashboards are missing:

kubectl logs -n monitoring deployment/monitoring-grafana -c grafana-sc-dashboard
If you don't see dashboards

The kube-prometheus-stack chart normally installs them automatically.

Check:

kubectl get configmaps -n monitoring | grep grafana

and

kubectl get secret -n monitoring monitoring-grafana 

# 📊 Monitoring Setup (Prometheus & Grafana)

The monitoring stack is deployed using the **kube-prometheus-stack Helm Chart**, which installs:

- Prometheus
- Grafana
- AlertManager
- Node Exporter
- kube-state-metrics

---

# Install Helm

```bash
curl -fsSL -o get_helm.sh \
https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh
```

Verify installation.

```bash
helm version
```

---

# Add the Prometheus Helm Repository

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

---

# Create Monitoring Namespace

```bash
kubectl create namespace monitoring
```

---

# Install Prometheus & Grafana

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring
```

---

# Verify Installation

Check all monitoring pods.

```bash
kubectl get pods -n monitoring
```

---

# Retrieve Grafana Admin Password

```bash
kubectl get secret monitoring-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d
```

Default username:

```
admin
```

Store the password securely.

---

# Access Grafana (Development)

Port-forward the Grafana service.

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-grafana \
3000:80
```

Open:

```
http://localhost:3000
```

---

# Access Prometheus (Development)

Port-forward Prometheus.

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-kube-prometheus-prometheus \
9090:9090
```

Open:

```
http://localhost:9090
```

Prometheus does not require authentication by default.

---

# Verify Monitoring Services

List all monitoring services.

```bash
kubectl get svc -n monitoring
```

---

# Optional: Expose Grafana Using a LoadBalancer

For demonstration purposes, Grafana can be exposed externally.

```bash
kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"LoadBalancer"}}'
```

Verify:

```bash
kubectl get svc monitoring-grafana -n monitoring
```

---

# Optional: Expose Prometheus Using a LoadBalancer

```bash
kubectl patch svc monitoring-kube-prometheus-prometheus \
-n monitoring \
-p '{"spec":{"type":"LoadBalancer"}}'
```

Verify:

```bash
kubectl get svc monitoring-kube-prometheus-prometheus -n monitoring
```

---

# Recommended Production Configuration

For production environments, avoid exposing internal services directly to the internet.

Recommended service types:

| Service | Type |
|---------|------|
| TravelBuddy Application | Application Load Balancer (ALB) |
| Grafana | ClusterIP + Ingress |
| Argo CD | ClusterIP + Ingress |
| Prometheus | ClusterIP |

Convert Grafana back to ClusterIP:

```bash
kubectl patch svc monitoring-grafana \
-n monitoring \
-p '{"spec":{"type":"ClusterIP"}}'
```

Convert Prometheus back to ClusterIP:

```bash
kubectl patch svc monitoring-kube-prometheus-prometheus \
-n monitoring \
-p '{"spec":{"type":"ClusterIP"}}'
```

Convert Argo CD back to ClusterIP:

```bash
kubectl patch svc argocd-server \
-n argocd \
-p '{"spec":{"type":"ClusterIP"}}'
```

---

# Access Services from Your Local Machine

Update your kubeconfig.

```bash
aws eks update-kubeconfig \
--region <AWS_REGION> \
--name travelbuddy-cluster
```

Use port forwarding to access the services locally.

### Argo CD

```bash
kubectl port-forward \
-n argocd \
svc/argocd-server \
8080:443
```

Open:

```
https://localhost:8080
```

---

### Grafana

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-grafana \
3000:80
```

Open:

```
http://localhost:3000
```

---

### Prometheus

```bash
kubectl port-forward \
-n monitoring \
svc/monitoring-kube-prometheus-prometheus \
9090:9090
```

Open:

```
http://localhost:9090
```

---

# Production Architecture

```text
                   Internet
                       │
                       ▼
             AWS Application Load Balancer
                       │
        ┌──────────────┴──────────────┐
        │                             │
        ▼                             ▼
 TravelBuddy Application       Grafana / Argo CD
        │                             │
        └──────────────┬──────────────┘
                       ▼
                Amazon EKS Cluster
                       │
       ┌───────────────┼────────────────┐
       │               │                │
       ▼               ▼                ▼
  TravelBuddy      Prometheus      Grafana
  Application
```

> **Note:** Prometheus is typically kept internal and accessed only by Grafana or cluster administrators.

---

# Verification Checklist

- ✅ Helm Installed
- ✅ Monitoring Namespace Created
- ✅ Prometheus Running
- ✅ Grafana Running
- ✅ AlertManager Running
- ✅ Node Exporter Running
- ✅ Dashboards Accessible
- ✅ Metrics Being Collected

# 📈 Recommended Grafana Dashboards

After installing the **kube-prometheus-stack**, import the following dashboards into Grafana to monitor your Kubernetes cluster and applications.

| Dashboard | Grafana Dashboard ID |
|-----------|---------------------:|
| 🖥️ Kubernetes Cluster Overview | **15757** |
| 🖥️ Kubernetes Node Monitoring | **15759** |
| 📦 Kubernetes Pod Monitoring | **15760** |
| 🌐 Kubernetes Network Monitoring | **15758** |
| 🚀 Kubernetes Deployments & Workloads | **15756** |
| 📊 Prometheus Monitoring | **3662** |
| 🎨 Grafana Monitoring | **3590** |

---

# 📥 Import Dashboards into Grafana

1. Open Grafana.

```
http://localhost:3000
```

2. Login using the Grafana credentials.

3. Navigate to:

```
Dashboards
    ↓
Import
```

4. Enter one of the Dashboard IDs listed above.

Example:

```
15757
```

5. Click **Load**.

6. Select your **Prometheus** datasource.

7. Click **Import**.

Repeat the same steps for all recommended dashboards.

---

# 📊 Monitoring Overview

The monitoring stack provides visibility into:

- Kubernetes Cluster Health
- Worker Node Resource Usage
- Pod CPU & Memory Usage
- Network Traffic
- Deployments & Replica Status
- Prometheus Metrics
- Grafana Performance

---

# 📸 Suggested Dashboard Screenshots

For this project, include screenshots of:

- Kubernetes Cluster Overview
- Node Monitoring
- Pod Monitoring
- Network Monitoring
- Deployment & Workloads
- Prometheus Dashboard
- Grafana Dashboard

These screenshots can be added to the `images/` folder and referenced in the README to showcase the monitoring capabilities of the project.