variable "environment_config" {
    description = "Environtment Configuration"
    type        = map(string)
}

variable "vpc_sg_ids" {
    description = "VPC SG ID"
    type        = list(string)
}

variable "subnet_ids" {
    description = "Subnet ID"
    type        = list(string)
}

variable "s3_bucket_name" {
    description = "S3 Bucket Name"
    type        = string
}

variable "s3_key" {
    description = "Key of file on S3"
    type        = string
}

variable "function_name" {
    description = "Lambda Funtion Name"
    type        = string
}

variable "layers" {
    description = "Layers For this function"
    type        = list(string)
}