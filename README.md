## For Continuous Integration Using Jenkins with Maven

1. Create an instance of an EC2 (Amazon Linux 2 AMI). For more on that, see [ec2-setup](https://github.com/carolynrehm/devops-script/blob/master/ec2-setup).

2. Connect to you EC2 using ssh.
> ssh -i [pem file] ec2-user@[public ip]

3. Install git 
> sudo yum install git -y

4. Clone this repository onto your EC2
> git clone https://github.com/carolynrehm/devops-script.git

5. Navigate into the project folder and execute install script. Select Java 8 when prompted.
> cd devops-script
> sh install.sh

6. Jenkins is ready for you to get started! Use the `cat` command to print the contents of the initialAdminPassword, install the suggested plugins, and set up an admin user.

    See [jenkinsfile-examples](https://github.com/carolynrehm/devops-script/tree/master/jenkinsfile-examples) for relevant pipeline scripts for your desired jobs. 

7. Make sure to add your webhook to your GitHub repository. This is done by navigating to the "Settings" tab and adding a webhook with a payload url of http://[your ec2 ip]:8080/github-webhook/ - for this to be functional, you must trigger the build once manually from the Jenkins console.

## For Continuous Deployment Using Jenkins with Maven + Containerization with Docker
1. Create an instance of an EC2 (Amazon Linux 2 AMI). For more on that, see [ec2-setup](https://github.com/carolynrehm/devops-script/blob/master/ec2-setup).

2. Connect to you EC2 using ssh.
> ssh -i [pem file] ec2-user@[public ip]

3. Install git 
> sudo yum install git -y

4. Clone this repository onto your EC2
> git clone https://github.com/carolynrehm/devops-script.git

5. Navigate into the project folder and execute install script. Select Java 8 when prompted.
> cd devops-script
> sh installv2.sh

6. Jenkins is ready for you to get started! Use the `cat` command to print the contents of the initialAdminPassword, install the suggested plugins, and set up an admin user.

    See [jenkinsfile-examples](https://github.com/carolynrehm/devops-script/tree/master/jenkinsfile-examples) for relevant pipeline scripts for your desired jobs. 

7. Make sure to add your webhook to your GitHub repository. This is done by navigating to the "Settings" tab and adding a webhook with a payload url of http://[your ec2 ip]:8080/github-webhook/ - for this to be functional, you must trigger the build once manually from the Jenkins console.