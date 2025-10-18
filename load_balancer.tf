# load_balancer.tf

# Cria o Load Balancer dentro da VPC
resource "aws_elb" "production_elb" {
  name               = "${var.project_name}-elb"
  subnets            = [aws_subnet.public_subnet.id]       # 🔹 Subnet da VPC
  security_groups    = [aws_security_group.instance_sg.id]  # 🔹 Mesmo SG das instâncias

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = [
    aws_instance.production_1.id,
    aws_instance.production_2.id
  ]

  tags = {
    Name = "${var.project_name}-elb"
  }
}

# Exibe o DNS do Load Balancer no output
output "load_balancer_dns" {
  value       = aws_elb.production_elb.dns_name
  description = "URL público do Load Balancer"
}


