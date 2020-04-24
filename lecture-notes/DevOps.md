# DevOps
- development (writing the code) + operations (maintaining the infrastructure to host your applications)
- devops combines these two processes to help us write better quality code more efficiently

### Continuous Integration
- regularly pushing your code into a shared repository, where tests are run and a build artifact is created automatically in order to determine if the new additions integrated successfully
- allows us to identify and resolve issues much more efficiently

### Continuous Delivery 
- CI + manual deployment of build artifact

### Continuous Deployment
- CI + automatic deployment of build artifact

## Maven
- up until now we've seen Maven used to help us manage our dependencies (we've provided this configuration in the pom.xml)
- 3 lifecycles maven provides: clean, default, site
- clean lifecycle removes previous artifacts
- default lifecycle creates an artifact
    - validate
    - compile
    - test (runs unit tests)
    - package (creates artifact)
    - verify (runs integration test)
    - install (installs package into local repository - your .m2 folder)
    - deploy (deploys artifact to remote repository for other developers to use)
- site deals with documentation

## Jenkins
- automation server which allows us to achieve CI/CD

### Setting up our CI/CD Pipeline
- EC2 (Elastic Compute Cloud), allocate infrastructure with AWS
    - Jenkins (reference GitHub repo, run maven commands)
    - Maven
    - JDK
- GitHub repository (configured with a jenkins webhook to trigger builds)

<hr>

# AWS 
## EC2 - Elastic Compute Cloud
- web service that provides secure, scalable compute capacity in the cloud

#### AMI - Amazon Machine Image
- template for your virtual server
- includes O/S + any other initial software 
- can create custom AMIs 

#### EBS - Elastic Block Storage
- configurable block storage that can be attached to an EC2
- root volume comes pre configured, but additional volumes of EBS can be attached 

#### Security Groups
- allows protocol and port level security configuration
- can set rules that filter traffic coming in/out of your EC2 instance

#### Autoscaling groups
- can configure EC2 to be a part of autoscaling groups 
- group scales up or down as needed (horizontal scaling)
<img src="https://www.webairy.com/wp-content/uploads/2019/07/hvsv.jpg" alt="autoscaling group">

#### Elastic Load Balancing (ELB)
- distributes incoming traffic across multiple AWS resources automatically
- send requests to a load balancer URL, and the requests are distributed appropriately
<img src="https://media.amazonwebservices.com/blog/2014/elb_instances_1.png" alt="elastic load balancing">

### Connecting to an EC2
> ssh -i [private key] ec2-user@[ip or endpoint]

# Linux 
- while linux isn't used on as many personal desktops, it dominates the market of servers
- it's lightweight and uses system resources efficiently
- free, open source, can be customized for your needs

### Common Linux Commands
- ls
- cd - change directory 
- cat - concatenate 
    - print the contents of a file 
    > cat test.txt
    - redirect standard output into a file 
    > cat test.txt > output.txt
- grep - global regular expressions print
- man - manual 
- wget - downloads from a url
- pwd - print working directory
- mkdir - make directory
- rmdir - remove directory (only works if empty, rm -r) 
- touch - creates a new file
- cp - copies first argument to second argument location 
- mv - also has two arguments, moves a file
- echo
- nano/vi 
- sudo - allows you to run commands as a super user
- chmod - change mode
    > chmod 777 test.txt
    [owner][group][everyone else]
    0 = no permissions 
    1 = execute
    2 = write 
    3 = execute + write
    4 = read
    5 = read + execute 
    6 = read + write 
    7 = read + write + execute

## Regions AZ

## IAM 