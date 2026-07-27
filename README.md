# TravelBuddy Infrastructure (Terraform)

## Project Overview

This repository provisions the complete AWS infrastructure required for the TravelBuddy DevOps project using Terraform.

The infrastructure includes:

- VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Jenkins EC2
- SonarQube EC2
- Amazon ECR
- Amazon EKS Cluster
- EKS Managed Node Group
- Application Load Balancer (Terraform Managed)
- IAM Roles & Instance Profiles

The application deployment and CI/CD pipeline are intentionally left for the next phase.

---

# Architecture

```
Internet
    │
    ▼
Application Load Balancer
    │
    ▼
VPC
├───────────────┐
│               │
│ Public        │
│ Subnets       │
│               │
│ Jenkins EC2   │
│               │
├───────────────┤
│               │
│ Private       │
│ Subnets       │
│               │
│ SonarQube EC2 │
│ EKS Worker    │
│ Nodes         │
│               │
└───────────────┘

Amazon ECR
Amazon EKS
```

---

# Repository Structure

```
TravelBuddy/
│
├── main.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   ├── security-groups/
│   ├── iam/
│   ├── jenkins/
│   ├── sonarqube/
│   ├── ecr/
│   ├── eks/
│   ├── alb/
│   ├── monitoring/
│   └── alb-controller/
│
└── scripts/
```

---

# Prerequisites

Install the following tools.

## Terraform

```
terraform version
```

Version:

```
>= 1.5
```

---

## AWS CLI

```
aws --version
```

---

## kubectl

```
kubectl version --client
```

---

## Docker

```
docker --version
```

---

## Helm

```
helm version
```

---

# AWS Credentials

Configure AWS CLI.

```
aws configure
```

Provide

```
AWS Access Key
AWS Secret Key
Region = us-east-1
Output = json
```

Verify

```
aws sts get-caller-identity
```

---

# Initialize Terraform

```
terraform init
```

---

# Validate

```
terraform validate
```

---

# Review Changes

```
terraform plan
```

---

# Create Infrastructure

```
terraform apply
```

Type

```
yes
```

---

# Verify Infrastructure

Check EC2

```
aws ec2 describe-instances
```

Check EKS

```
aws eks list-clusters
```

Expected cluster

```
travelbuddy-cluster
```

Update kubeconfig

```
aws eks update-kubeconfig \
--region us-east-1 \
--name travelbuddy-cluster
```

Verify Nodes

```
kubectl get nodes -o wide
```

Expected

```
Ready
Ready
```

---

# Outputs

Terraform outputs

```
terraform output
```

Important outputs

- Cluster Name
- Cluster Endpoint
- ECR Repository
- Jenkins Instance
- SonarQube Private IP
- Public Subnets
- Private Subnets

---

# Destroy Infrastructure

To avoid AWS charges

```
terraform destroy
```

Type

```
yes
```

To recreate later

```
terraform apply
```

---

# Remaining Work

Infrastructure is completed.

The remaining tasks are:

## 1. AWS Load Balancer Controller

- Configure IRSA
- Install Helm Chart
- Verify Controller

---

## 2. Application

Deploy TravelBuddy application to EKS.

Create

```
deployment.yaml
service.yaml
ingress.yaml
```

Deploy

```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

---

## 3. Docker

Build Docker Image

```
docker build -t travelbuddy .
```

Tag

```
docker tag travelbuddy:latest \
<ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/travelbuddy-repo:latest
```

Push

```
docker push \
<ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/travelbuddy-repo:latest
```

---

## 4. Jenkins

Configure

- GitHub Webhook
- Credentials
- SonarQube
- Docker
- AWS CLI
- kubectl
- Helm

Create Jenkins Pipeline

Flow

```
GitHub
   ↓
Jenkins
   ↓
SonarQube
   ↓
Docker Build
   ↓
Push to ECR
   ↓
Deploy to EKS
```

---

## 5. SonarQube

Configure Jenkins integration.

Run code analysis before Docker build.

---

## 6. Kubernetes

Deploy

- Deployment
- Service
- Ingress

Verify

```
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

## 7. ArgoCD (GitOps)

Install ArgoCD.

Connect GitHub Repository.

Configure Auto Sync.

---

## 8. Monitoring

Deploy

- Prometheus
- Grafana

Monitor

- Node Metrics
- Pod Metrics
- Cluster Metrics

---

# Troubleshooting

Terraform

```
terraform validate
terraform plan
terraform apply
```

Reinitialize

```
rm -rf .terraform
rm .terraform.lock.hcl

terraform init
```

Update kubeconfig

```
aws eks update-kubeconfig \
--region us-east-1 \
--name travelbuddy-cluster
```

Verify Nodes

```
kubectl get nodes
```

---

# Notes

- Region: us-east-1
- Infrastructure managed completely through Terraform.
- Do not manually edit AWS resources unless necessary.
- Use Terraform for infrastructure changes.
- Destroy infrastructure after testing to avoid AWS charges.

---

# Project Status

| Component | Status |
|-----------|--------|
| VPC | ✅ |
| Public Subnets | ✅ |
| Private Subnets | ✅ |
| Internet Gateway | ✅ |
| NAT Gateway | ✅ |
| Route Tables | ✅ |
| Security Groups | ✅ |
| IAM | ✅ |
| Jenkins | ✅ |
| SonarQube | ✅ |
| Amazon ECR | ✅ |
| Amazon EKS | ✅ |
| Node Group | ✅ |
| ALB | ✅ |
| AWS Load Balancer Controller | ⏳ |
| Application Deployment | ⏳ |
| Jenkins Pipeline | ⏳ |
| ArgoCD | ⏳ |
| Monitoring | ⏳ |

---

## Author

Infrastructure developed using Terraform for the TravelBuddy DevOps Project.
