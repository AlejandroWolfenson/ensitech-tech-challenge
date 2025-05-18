# modules/vpc/main.tf
resource "aws_vpc" "vpc" {
  
  cidr_block            = var.vpc_block
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = merge(
    var.default_tags,
    {
    Name = var.vpc_name
    },
  )
}

resource "aws_internet_gateway" "ig" {
  
  vpc_id = aws_vpc.vpc.id


  tags = merge(
    var.default_tags,
    {
   Name = var.internet_gateway_name
    },
  )
}


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = var.default_tags
    
}

output "rt_id" {
  value = aws_route_table.rt.id
}


output "vpc_id" {
  value = aws_vpc.vpc.id 
}
