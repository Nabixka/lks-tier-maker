resource "aws_lambda_function" "lambda" {
  s3_bucket     = var.s3_bucket_name
  s3_key        = var.s3_bucket_key
  function_name = var.function_name
  role          = var.aws_role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.13"
  layers        = var.layers

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.vpc_sg_ids
  }

  environment {
    variables = var.environment_config
  }
}