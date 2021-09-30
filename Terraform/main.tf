variable "my_access_key" {
  description = "Access-key-for-AWS"
  default = "no_access_key_value_found"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default = "no_secret_key_value_found"
}
 
provider "aws" {
   region = "us-east-2"
   access_key = var.my_access_key
   secret_key = var.my_secret_key
}


resource "aws_instance" "javier-vlipco" {
    ami = "ami-00dfe2c7ce89a450b"
    instance_type = "t2.micro"
    key_name = "vlipco-ssh-key"
    tags = {
       Name = "Javier Lopez Vlipco"
    }
    vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_http" {
    name = "allow_http"
    description = "Allow HTTP traffic"
    ingress {
       description = "HTTP"
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
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH traffic"
    ingress {
       description = "SSH"
       from_port   = 22
       to_port     = 22
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
    }
}
