resource "aws_security_group" "ec2_sg" {
  name        = "ec2-http-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id 

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
}
 #locals {
  # user_data_files = [
   #  file("${path.module}/userdata_1.sh"),
    # file("${path.module}/userdata_2.sh")
   #]
 #}


resource "aws_instance" "public_instances" {
  count         = var.public_instance
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t3.medium"
  subnet_id     = var.public_subnet_ids[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  
 # user_data = local.user_data_files[0]
user_data = <<-EOF
#!/bin/bash
# Update and install Docker
sudo apt update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sleep 5
# Install Nginx
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Create custom index.html
sudo echo "This is my 11th use case" > /var/www/html/index.html
sudo systemctl restart nginx
EOF

  tags = {
    Name = "Public-Instance-${var.project_name}"
    Environment = var.environment
  }
}






