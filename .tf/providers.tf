provider "aws" {
  region = "us-east-1"
  access_key = var.TF_VAR_ACCESS_KEY
  secret_key = var.TF_VAR_SECRET_KEY
}