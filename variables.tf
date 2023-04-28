######################EC2 VARIABLES#######################
//Image ID
variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instances"
  type        = string
  default = "ami-0ec7f9846da6b0f61" //Ubuntu Server 22.04 LTS

}

variable "instance_type" {
  description = "Instance type of the EC2 instances"
  type        = string
  default = "t2.micro"
}

// Key Name for the EC2 Instance to use
variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default = "ssh-access"
}

//SubnetID of the required availability zone , can be acquired by running - aws ec2 describe-subnets --region eu-central-1
variable "subnet_id" {
  description = "ID of the subnet to launch the EC2 instances in"
  type        = string
  default = "subnet-01976201061a8a63d"
}
##########################################################



