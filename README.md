# Deploy-AWS-VPC---webservers-with-Ansible
### This is a cloud engineering assignment from Altschool Africa
![AWS Architecture](https://github.com/segunAlf-dev/Deploying-AWS-VPC_Loadbalancer-to-host-webservers-using-Ansible/blob/main/AWS%20Arch..png)
##### source: [AWS](https://aws.amazon.com/blogs/security/protect-your-remote-workforce-by-using-a-managed-dns-firewall-and-network-firewall/)
## Introduction
### To create a VPC (Virtual Private Cloud) with public and private subnets is one of the ways to segregate applications and resources from the public internet.This Readme is a simple guide on how to create a VPC with subnets, route tables, internet gateway, NAT gateway, and security groups in AWS (Amazon Web Services)
### Perequisites
#### i. Signin into aws console ( You must create an account on aws to access the console)
#### ii. Create an IAM user with permissions
#### iii. A good laptop with a good internet connection :technologist:
## A simple step-by-step guide using aws console
## 1. Create a VPC (Virtual Private Cloud)
 - Login into aws console 
 - Navigate to AWS services and search for VPC, 
 - Then navigate to the left menu bar and click on your VPC to create
 - In the name tag innput your custom vpc name. For example, **"Altschool Vpc"**
 - Input your IPv4 CDIR block, for example **"10.0.0.0/16"**. Click on create Vpc button 
 ## 2. Subnets
 - By your top right on the services menu, click on subnets
 - Choose your custom vpc created earlier in step 1
 - Input your custom subnet name and choose your availability zone AZ **(US-east1a)** 
 - Input your custom IPv4 CIDR block subnet
 - Then click on the create subnet button 
 - Repeat the process to create 3 more **(2 public [AZ- US-east1a & US-east1b], 2 private subnets [US-east1a & US-east1b])**
 - 
 ## 3. Route Tables
 - Click on route table
 - Next you click the create route table button
 - Input your custom route table **(Altschool-route-table)** name and choose your custom Vpc ID
 - After creating the route table, then click on your route table custom name **(Altschool-route-table)**
   - To separate your private and public subnets
 - Navigate to subnets association, then click on it 
   - Then, edit it to separate the private and public subnets
 - Afterwards, a default route table would exist with same custom vpc and rename it. For instance, let's use **(altschool-public-route-table)**
 ## 4. Internet Gateways
 - On Vpc services menu, click on internet gateways
 - Click on create internet gateways button
  - Input your custom internet gateway name **(Altschool-gateway)**
  - Then, create internet gateway
 - Select the gateway created, then click on actions select button and select ** Attach to Vpc **
  - Next navigate to your route tables and select your custom public route **(altschool-public-route-table)** created earlier 
  - You would see some details below choose **routes**, then **edit routes**
  - Click on add route, under **"destination"**and input an IP from anywhere [**(0.0.0.0/0)**, it means to allow the whole internet or any IP address to communicate with the webserver]
  - Next under the **target**, search for internet gateway and select the populated internet gateway ID
 
 ## 5. NAT Gateways 
 -  Click on create nat gateway button
  - Input your custom nat gateway name **(Altschool-nat-gateway)**
  - Then, choose your public 1a or public 1b subnets gateway
 - Next click on allocate elastic IP address
 - Create nat gateway
 - Next navigate to your route tables and select your custom route name 
  - You would see some details below choose **routes**, then **edit routes**
  - Click on add route, under **"destination"**and input an IP from anywhere [**(0.0.0.0/0)**, it means to allow the whole internet or any IP address to communicate with the webserver]
  - Next under the **target**, search for nat gateway and select the populated nat ID
 ## 6. Security Group
 - Go to security section on the services menu and click on security group
 - Click on create security group
  - Input a custom security group name
  - Input a fitting description 
  - Select your custom vpc from the dropdown **(Altschool Vpc)**
  - Add Inbound rules and under "Type" select "All Traffic", "Source" "select Anywhere"
  - Next click on create security group button
 ### Hurray! You just created a VPC with both public and private subnets
 ## 7. Spin up AWS Ec2 Instance
 - Navigate to aws services and search for Ec2 instance
 - Click on "Launch Instance" button; to create an instance
  - Input the custom name for your instance
  - Select the Ubuntu OS application from list of OS Images
  - Next create a new key-pair, if you don't have an existing key-pair
  - For Networks, edit network settings 
   - choose your private subnet, in this case  ** US-east1a ** 
   - select an existing security group **(altschool-security-group)**
    - Configure storage to choice and do keep in mind the cost implications
   - then you launch the instance 
  - Repeat the same process to create 2 more instances one with the second private subnet and the other with a public subnet 
 ## Load Balancer
 - In this section, cliclk on "Target Groups"
 - Click on create target group; input a targget group name
 - Select your custom Vpc **(Altschool Vpc)**
 - Click on next
 - Then select your 2 private instances 
 
