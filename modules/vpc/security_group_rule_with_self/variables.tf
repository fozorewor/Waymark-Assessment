variable "security_group_id" {
  description = "Security group to apply this rule to."
  default     = null
}

variable "type" {
  description = "Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  default     = null
}

variable "protocol" {
  description = "Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number."  # (https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)
  default     = null
}

variable "description" {
  description = "Description of the rule."
  default     = null
}

variable "self" {
  description = "Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id."
  default     = null
}

variable "from_port" {
  description = "Start port (or ICMP type number if protocol is icmp or icmpv6)."
  default     = null
}

variable "to_port" {
  description = "End port (or ICMP code if protocol is icmp)."
  default     = null
}
