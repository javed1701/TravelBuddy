#!/bin/bash
set -euxo pipefail

# Update system
apt update -y
apt upgrade -y

# Install dependencies
apt install -y \
  fontconfig \
  openjdk-21-jre \
  curl \
  gnupg \
  ca-certificates

# -------------------------
# Install Docker
# -------------------------

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg \
-o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian trixie stable" \
> /etc/apt/sources.list.d/docker.list

apt update -y

apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

systemctl enable docker
systemctl start docker


# Add default Debian user to docker group
if id admin >/dev/null 2>&1; then
  usermod -aG docker admin
fi


# -------------------------
# Install Jenkins
# -------------------------

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
| gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg

echo \
"deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

apt update -y

apt install -y jenkins

systemctl enable jenkins
systemctl start jenkins


# -------------------------
# Configure SonarQube
# -------------------------

sysctl -w vm.max_map_count=262144

echo "vm.max_map_count=262144" >> /etc/sysctl.conf


# Run SonarQube container

docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  --restart unless-stopped \
  sonarqube:lts-community


echo "Installation completed successfully"