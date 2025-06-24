provider "aws" {
  region = var.aws_region
}

# Bucket de entrada (para los .csv)
resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = var.input_bucket_name
  force_destroy = true

  tags = {
    Name        = "bucket-csv-entrada"
    Environment = "dev"
  }
}

# Bucket de salida (para los reportes generados por Lambda)
resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = var.output_bucket_name
  force_destroy = true

  tags = {
    Name        = "bucket-reportes-salida"
    Environment = "dev"
  }
}
