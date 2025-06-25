provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "csv_input_bucket" {
  bucket        = "proyecto-csv-entrada-2025"
  force_destroy = true
}

resource "aws_s3_bucket" "report_output_bucket" {
  bucket        = "proyecto-reportes-procesados"
  force_destroy = true
}

# 🔗 Configurar trigger de S3 → Lambda
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.input_bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.my_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    aws_lambda_function.my_lambda,
    aws_s3_bucket.csv_input_bucket,
    aws_lambda_permission.allow_s3_invoke
  ]
}