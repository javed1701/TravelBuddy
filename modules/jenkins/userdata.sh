#!/bin/bash

yum update -y

dnf install java-17-amazon-corretto -y

dnf install git -y

dnf install docker -y

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

dnf install jenkins -y

systemctl enable jenkins

systemctl start jenkins