resource "aws_security_group" "alb_sg" {
  name_prefix = "alb_sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.rules.id]
  }
}

resource "aws_alb" "webapp" {
  name            = "webapp-ALB"
  security_groups = [aws_security_group.alb_sg.id]
  subnets         = ["subnet-04d3434ca66409721", "subnet-067cacd5f47921a69", "subnet-01976201061a8a63d"]
  //                            eu-central-1c               eu-central-1b                 eu-central-1a          
}

resource "aws_alb_target_group" "tgroup" {
  name        = "webapp"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-00b5c19c399c2c77d"
}

resource "aws_alb_target_group_attachment" "to_ec2" {
  target_group_arn = aws_alb_target_group.tgroup.arn
  count            = length(aws_instance.ec2_instance)
  target_id        = aws_instance.ec2_instance[count.index].id
  port             = 80
}


resource "aws_alb_listener" "listen" {
  load_balancer_arn = aws_alb.webapp.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tgroup.arn
  }
}
