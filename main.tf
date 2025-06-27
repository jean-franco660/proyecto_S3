provider "aws" {
  region = var.aws_region
}

# 🪣 Bucket de entrada CSV
resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = "proyecto-csv-entrada"
  force_destroy = true
}

# 🪣 Bucket de salida de reportes
resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = "proyecto-csv-salida"
  force_destroy = true
}

