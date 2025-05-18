# modules/subnet/main.tf

resource "aws_subnet" "sn" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    var.default_tags,
    {
   Name = var.subnet_name
    },
  )
}


resource "aws_route_table_association" "associate-routetable" {
  subnet_id      = aws_subnet.sn.id
  route_table_id = var.routetable_id
}

output "sn_id" {
      value= aws_subnet.sn.id
  }