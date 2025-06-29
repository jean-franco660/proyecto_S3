# 🪣 Bucket de entrada CSV
resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = var.input_bucket_name
  force_destroy = true
}

# 🪣 Bucket de salida de reportes
resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = var.output_bucket_name
  force_destroy = true
}
