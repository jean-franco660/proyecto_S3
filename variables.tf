variable "input_bucket_name" {
  type        = string
  description = "Nombre del bucket para recibir archivos CSV"
}

variable "output_bucket_name" {
  type        = string
  description = "Nombre del bucket para guardar reportes JSON"
}

variable "lambda_function_arn" {
  type        = string
  description = "ARN de la función Lambda que se activa con el trigger"
}
