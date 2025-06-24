provider "aws" {
  region = var.aws_region
}

# 🪣 Crear el bucket S3 principal
resource "aws_s3_bucket" "mi_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}

# 🔒 Bloquear acceso público
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.mi_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# 🔐 Activar cifrado automático (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "mi_bucket_encryption" {
  bucket = aws_s3_bucket.mi_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
