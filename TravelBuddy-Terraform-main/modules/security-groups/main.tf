resource "aws_security_group" "bastion_sg" {
    name = "${var.project_name}-bastion-sg"
    description = "Security group for bastion host"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        description = "All traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-bastion-sg"
    }
}


resource "aws_security_group" "jenkins_sg" {
    name = "${var.project_name}-jenkins-sg"
    description = "Security group for Jenkins server"
    vpc_id = var.vpc_id

    ingress {
        description = "Jenkins UI"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    ingress {
        description = "SSH from bastion"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    egress {
        description = "All traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-jenkins-sg"
    }
}

resource "aws_security_group" "sonarqube_sg" {
    name = "${var.project_name}-sonarqube-sg"
    vpc_id = var.vpc_id

    ingress {
        description = "SonarQube UI"
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        security_groups = [aws_security_group.jenkins_sg.id]
    }

    ingress {
        description = "SSH from bastion"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    egress {
        description = "All traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-sonarqube-sg"
    }
}

resource "aws_security_group" "eks" {
    name = "${var.project_name}-eks-sg"
    vpc_id = var.vpc_id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}