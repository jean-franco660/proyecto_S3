output "input_bucket_name" {
  description = "Nombre del bucket de entrada"
  value       = aws_s3_bucket.input_bucket_name.bucket
}

output "output_bucket_name" {
  description = "Nombre del bucket de salida"
  value       = aws_s3_bucket.output_bucket_name.bucket
}
