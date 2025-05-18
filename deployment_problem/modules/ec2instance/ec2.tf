#modules/ec2instance/main.tf

# Create EC2 instance
resource "aws_instance" "main" {
  ami                    = var.ec2_imageid
  instance_type          = var.ec2_instancetype
  key_name               = var.ec2_decryptkeyname
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.securitygroup_id]
  associate_public_ip_address = true
  #user_data              = var.ec2_userdata_script 

  tags = merge(
    var.default_tags,
    {
    Name = var.ec2_name
    },
  )

  root_block_device {
    volume_size = var.ec2_disksize
    volume_type = var.ec2_disktype
  }
}

output "ec2_id" {
  value = aws_instance.main.id
}