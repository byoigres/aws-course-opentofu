resource "aws_security_group" "ec2_security_group" {
  name = "${var.environment}-${var.stage}-ec2-sg"
}

resource "aws_security_group_rule" "ec2_ssh_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_http_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_all_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
