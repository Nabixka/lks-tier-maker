resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check = var.source_dest_check
  subnet_id     = var.subnet_id
  user_data

  tags = {
    Name = "lks-apps"
  }
}
