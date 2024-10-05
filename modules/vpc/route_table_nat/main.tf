resource "aws_route_table" "rt" {

  vpc_id = var.rt_vpc_id

  route {
    cidr_block     = var.rt_route_cidr_block
    nat_gateway_id = var.rt_route_nat_gateway_id
  }

  tags = var.rt_tags

}
