resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids
  key_name      = var.key_name
  associate_public_ip_address = true
  iam_instance_profile = var.instance_profile

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name        = "${var.project_name}-jenkins"
  }

  user_data = file("${path.module}/userdata.sh")
}