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


echo "downloading tomcat tar.gz"
sudo cd /tmp
sudo wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
sudo tar -xzvf apache-tomcat-8.5.35.tar.gz
echo "giving ec2-user permission for tomcat"
sudo chmod 777 -R apache-tomcat-8.5.35
sudo mkdir /usr/apache
sudo mv apache-tomcat-8.5.35 /usr/apache/
sudo sed -i 's/<Connector port="8080"/<Connector port="8090"/' /usr/apache/apache-tomcat-8.5.35/conf/server.xml
sudo sh /usr/apache/apache-tomcat-8.5.35/bin/startup.sh
echo "CATALINA_HOME=/usr/apache/apache-tomcat-8.5.35"  >> ~/.bashrc
echo "export CATALINA_HOME"  >> ~/.bashrc

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y   
echo "jenkins installed now starting"
sudo service jenkins start
echo "jenkins started"

echo "allocating 1 GB swap space"
sudo dd if=/dev/zero of=/swapfile bs=128M count=8
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab
echo "swap allocated"
