//ec2 instance resource creation, all values are refered inside variables.tf 
resource "aws_instance" "ec2_instance" {
  count = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.rules.id]

  tags = {
    Name = "ALB-EC2-webapp-${count.index+1}"
  }

  user_data = <<-EOF
  #!/bin/bash
  apt-get install git -y 
  git clone https://github.com/tomerschwartz24/ALB-app.git
  cd ALB-app 
  ./ec2-user_data.sh
  EOF
}
