output "ec2_apps_id" {
    description = "EC2 Apps Id"
    value       = module.ec2_apps.ec2_instance_id
}