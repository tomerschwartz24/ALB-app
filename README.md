# AWS ELB/ALB Golang Application
## ___Golang Web application behind an AWS Application load balancer___
## Tools | Terraform | ELB | ALB | EC2 | EC2 User Data | AWS Security Groups | AWS Target Groups | Systemd | Golang
  
  <img src="README-resources/ec2pic.png" alt="alt text" width="60" height="60"> 
  <img src="README-resources/elbpic.png" alt="alt text" width="60" height="60"> 
  <img src="README-resources/gopic.png" alt="alt text" width="70" height="80"> 
  <img src="README-resources/tf.png" alt="alt text" width="90" height="90">




### ___Overview___
* EC2 instances creation (___aws_instance.ec2_instance___) with the relevant variables (__var.instance_type___) (___var.key_name___) (___var.subnet_id___) + security group (___aws_security_group.rules___) with ports 80/22 is initialized.
* an application load balancer resource (___aws_alb.webapp___) is created with listener on port 80
* a target group is created (___aws_alb_target_group.tgroup___) to point the ALB to the relevant ec2 instances 
* an attachment of the target group between the ALB and the instances occours using (___aws_alb_target_group_attachment.to_ec2___)
* an additional security group for the loadbalancer resources is also created to allow inbound & outbound traffic (___aws_security_group.alb_sg___)
###  ___A Golang webserver is deployed on ec2 instances___
  1. In this project i utilized ec2 user data capabilities with a custom script in order to deploy the Go Webserver with systemd.
  2. the custom script clones this repo & compiles the golang application & creates and executes a systemd service which listens on port 80

### ___This project utilizes Terraform in order to deploy AWS resources___
  1. all relevant .tf files to deploy the necessary ELB and webserver are included
  2. Terraform deployment visualalization :  

  <img src="README-resources/TF-Graph.jpg" alt="alt text" width="750" height="600">
