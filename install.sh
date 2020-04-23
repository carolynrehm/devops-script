#!/bin/sh

echo "updating existing packages"
sudo yum update -y

echo "installing java 8"
sudo yum install -y java-1.8.0-openjdk-devel
sudo update-alternatives --config java
sudo update-alternatives --config javac
echo "java 8 installed and configured"

echo "installing maven"
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
echo "maven installed"

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y   
echo "jenkins installed now starting"
sudo service jenkins start
echo "jenkins started"
