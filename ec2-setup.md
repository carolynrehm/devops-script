1. Login to the AWS console.

2. Navigate to the "Instances" tab in the EC2 console.

3. Click "Launch Instance".

4. Select the "Free tier only" checkbox.  A free tier account is allotted one t2.micro EC2 for 750 hours a month. 

Select the Amazon Linux 2 AMI and t2.micro for Instance Type.

5. Instance details and storage can be left as the default.

6. Add a Name tag to help more easily identify your instance.

7. Create a new security group with an appropriate name and description. Try to keep this as restrictive as possible, but you will need to set at least the following rules: 
- ssh on port 22 for your IP
- custom tcp on port 8080 for your IP
- custom tcp for each port(s) you plan to deploy application(s)
- custom tcp on port 8080 for each of the hook endpoints found at github's [meta endpoint](https://api.github.com/meta)