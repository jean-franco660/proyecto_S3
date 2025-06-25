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

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${aws_s3_bucket.csv_input_bucket.bucket}"
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.csv_input_bucket.id

  lambda_function {
  lambda_function_arn = var.lambda_function_arn
  events              = ["s3:ObjectCreated:*"]
}

  depends_on = [aws_lambda_permission.allow_s3_invoke]
}