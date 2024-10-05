resource "aws_route_table" "rt" {

  vpc_id = var.rt_vpc_id

  route {
    cidr_block = var.rt_route_cidr_block
    gateway_id = var.rt_route_gateway_id
  }

  tags = var.rt_tags

}
