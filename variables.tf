variable "input_bucket_name" {
  type        = string
  description = "Nombre del bucket para recibir archivos CSV"
}

variable "output_bucket_name" {
  type        = string
  description = "Nombre del bucket para guardar reportes JSON"
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda que será invocada"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN de la función Lambda que será invocada"
  type        = string
}
