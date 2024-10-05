resource "aws_route_table" "rt" {

  vpc_id = var.rt_vpc_id
  tags   = var.rt_tags

}
