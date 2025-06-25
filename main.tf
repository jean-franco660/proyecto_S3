provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = "proyecto-csv-entrada-2025"
  force_destroy = true

  tags = {
    Name        = "proyecto-csv-entrada-2025"
    Environment = var.env
  }
}

resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = "proyecto-reportes-procesados"
  force_destroy = true

  tags = {
    Name        = "proyecto-reportes-procesados"
    Environment = var.env
  }
}