output "ec2_instance_id" {
    description = "EC2 Instance Id"
    value       = aws_instance.main.id
}