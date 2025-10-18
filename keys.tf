# keys.tf

# Gera uma nova chave SSH localmente
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Salva a chave pública na AWS (para acesso às instâncias EC2)
resource "aws_key_pair" "devops_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.devops_key.public_key_openssh
}

# Salva a chave privada localmente (para uso posterior, se necessário)
resource "local_file" "private_key_pem" {
  content  = tls_private_key.devops_key.private_key_pem
  filename = "${path.module}/devops-key.pem"
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}

