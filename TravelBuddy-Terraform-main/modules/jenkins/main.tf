
resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids
  key_name      = var.key_name

  # Elastic IP will provide the public IP.
  associate_public_ip_address = false

  iam_instance_profile = var.instance_profile

  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "${var.project_name}-jenkins"
  }

  user_data = file("${path.module}/userdata.sh")
}

# Permanent public IP for Jenkins
resource "aws_eip" "jenkins" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-jenkins-eip"
  }
}

# Attach the Elastic IP to the Jenkins EC2 instance
resource "aws_eip_association" "jenkins" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins.id
}

