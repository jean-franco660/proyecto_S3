provider "aws" {
  region = var.aws_region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

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
