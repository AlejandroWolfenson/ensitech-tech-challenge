#modules/securitygroup/main.tf

# Create Security Group
resource "aws_security_group" "sg" {
  name          = var.securitygroup_name
  vpc_id = var.vpc_id
   
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.block_allow_ingress  # Adjust to restrict access to a specific IP range if needed
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust to restrict access to a specific IP range if needed
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust to restrict access to a specific IP range if needed
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(
    var.default_tags,
    {
    Name = var.securitygroup_name
    },
  )
}

 output "sg_id" {
      value= aws_security_group.sg.id
  }