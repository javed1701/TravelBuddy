#!/bin/bash

dnf update -y

dnf install java-17-amazon-corretto -y

dnf install docker -y

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

docker run -d \
--name sonarqube \
-p 9000:9000 \
sonarqube:lts-community