terraform {
    required_version = ">= 0.12"
}

resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = "${var.vpc_id}"

  # SSH access from the VPC
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
	
ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Environment" = var.environment_tag
  }
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey-${var.environment_tag}"
  public_key = var.public_ssh_key
}

resource "aws_instance" "testInstance" {
#  count         = var.instance_count  
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = "${var.public_subnet_id}"
  vpc_security_group_ids = [aws_security_group.sg_22.id]
  key_name = aws_key_pair.ec2key.key_name

  tags = {
		"Environment" = var.environment_tag
    "Name" = var.instance_name
	}
}
