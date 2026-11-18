output "lambda_arn" {
    description = "Arn of Lambda Function"
    value       = aws_lambda_function.lambda.arn
}