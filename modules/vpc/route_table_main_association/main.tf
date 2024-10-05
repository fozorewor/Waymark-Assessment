resource "aws_main_route_table_association" "rtma" {

  route_table_id = var.route_table_id
  vpc_id         = var.vpc_id

}
