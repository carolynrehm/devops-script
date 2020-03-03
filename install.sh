#!/bin/sh

echo "installing git"
sudo yum install git -y
echo "git installed"

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
sudo wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.31/bin/apache-tomcat-9.0.31.tar.gz
sudo tar -xzvf apache-tomcat-9.0.31.tar.gz
echo "giving ec2-user permission for tomcat"
sudo chmod 777 -R apache-tomcat-9.0.31
sudo mkdir /usr/apache
sudo mv apache-tomcat-9.0.31 /usr/apache/
sudo sed -i 's/<Connector port="8080"/<Connector port="8090"/' /usr/apache/apache-tomcat-9.0.31/conf/server.xml
sudo sh /usr/apache/apache-tomcat-9.0.31/bin/startup.sh
echo "CATALINA_HOME=/usr/apache/apache-tomcat-9.0.31"  >> ~/.bashrc
echo "export CATALINA_HOME"  >> ~/.bashrc

echo "installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
echo "jenkins installed now starting"
sudo service jenkins start
echo "jenkins started"