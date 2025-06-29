resource "aws_s3_bucket" "csv_input_bucket" {
  bucket = var.input_bucket_name
}

resource "aws_s3_bucket" "csv_output_bucket" {
  bucket = var.output_bucket_name
}

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.input_bucket_name}"
}

resource "aws_s3_bucket_notification" "csv_input_notification" {
  bucket = aws_s3_bucket.csv_input_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "input/"
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_permission.allow_s3_invoke]
}