# ===============================
# COMPUTE RESOURCES
# ===============================

# EC2 - Jenkins Controller
resource "aws_instance" "jenkins_controller" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  # Chama o script de instalação do Jenkins
  user_data = file("scripts/jenkins_install.sh")

  tags = {
    Name = "${var.project_name}-jenkins-controller"
  }
}

# EC2 - Testing Environment
resource "aws_instance" "testing_env" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.project_name}-testing"
  }
}

# EC2 - Staging Environment
resource "aws_instance" "staging_env" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.project_name}-staging"
  }
}

# EC2 - Production 1
resource "aws_instance" "production_1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.project_name}-production-1"
  }
}

# EC2 - Production 2
resource "aws_instance" "production_2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.project_name}-production-2"
  }
}

