resource "aws_instance" "sonarqube" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  associate_public_ip_address = false

  key_name = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  root_block_device {
    volume_size           = 30
    volume_type            = "gp3"
    delete_on_termination = true
  }

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "${var.project_name}-sonarqube"
  }
}