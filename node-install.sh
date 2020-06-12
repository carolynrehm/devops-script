#!/bin/sh

echo "updating existing packages"
sudo yum update -y

echo "installing node"
sudo yum install -y nodejs
echo "node installed"

echo "installing java 8"
sudo yum install -y java-1.8.0-openjdk-devel
sudo update-alternatives --config java
sudo update-alternatives --config javac
echo "java 8 installed and configured"

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y   
echo "jenkins installed now starting"
sudo service jenkins start
echo "jenkins started"