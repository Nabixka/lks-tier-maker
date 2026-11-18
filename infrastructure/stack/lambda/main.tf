resource "aws_lambda_layer_version" "layer" {
  s3_bucket = var.s3_bucket_name
  s3_key    = "layer.zip"

  layer_name = "lks-lambda-layer"

  compatible_runtimes      = ["python3.12"]
  compatible_architectures = ["x86_64"]
}