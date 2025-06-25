provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = "proyecto-csv-entrada-2025-${var.env}"
  force_destroy = true

  tags = {
    Name        = "proyecto-csv-entrada-2025_${var.env}"
    Environment = var.env
  }
}

resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = "proyecto-reportes-procesados-${var.env}"
  force_destroy = true

  tags = {
    Name        = "proyecto-reportes-procesados_${var.env}"
    Environment = var.env
  }
}