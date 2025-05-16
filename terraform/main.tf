provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "portfolio" {
  ami           = "ami-03bb6d83c60fc5f7c" # Amazon Linux 2023
  instance_type = "t2.micro"

  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.portfolio_sg.id]

  tags = {
    Name = "SmartPortfolioApp"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker git -y
              service docker start
              usermod -a -G docker ec2-user
              chkconfig docker on
              EOF
}

resource "aws_security_group" "portfolio_sg" {
  name        = "portfolio_sg"
  description = "Allow web traffic"
  ingress = [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Custom port"
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}
