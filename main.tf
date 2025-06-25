provider "aws" {
  region = var.aws_region
}

# Bucket de entrada (para los .csv)
resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = "bucket-csv-entrada-${var.env}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "bucket-csv-entrada_${var.env}"
    Environment = var.env
  }
}


resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = "bucket-reportes-salida-${var.env}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "bucket-reportes-salida_${var.env}"
    Environment = var.env
  }
}

