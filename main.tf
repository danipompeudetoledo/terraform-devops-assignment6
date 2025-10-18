# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

# O Terraform carregará automaticamente todos os arquivos .tf do diretório.
# Não precisamos declarar módulos manuais aqui.

