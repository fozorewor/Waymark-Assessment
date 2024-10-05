resource "aws_security_group_rule" "sgr" {

  security_group_id        = var.security_group_id
  type                     = var.type
  protocol                 = var.protocol
  description              = var.description
  self                     = var.self
  from_port                = var.from_port
  to_port                  = var.to_port

}
