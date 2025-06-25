variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "input_bucket_name" {
  description = "Nombre del bucket de entrada para CSV"
  type        = string
}

variable "output_bucket_name" {
  description = "Nombre del bucket de salida para reportes"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN de la función Lambda"
  type        = string
}
