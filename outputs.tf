output "input_bucket_name" {
  description = "Nombre del bucket de entrada"
  value       = aws_s3_bucket.csv_input_bucket.bucket
}

output "output_bucket_name" {
  description = "Nombre del bucket de salida"
  value       = aws_s3_bucket.report_output_bucket.bucket
}
