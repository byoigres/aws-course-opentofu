resource "aws_security_group" "ec2_security_group" {
  name = "${var.environment}-${var.stage}-ec2-sg"
  tags = local.tags

  description = "Security group for EC2 instances in the ${var.environment} environment and ${var.stage} stage"
}

resource "aws_security_group_rule" "ec2_ssh_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]

  description = "Allow SSH access from anywhere"
}

resource "aws_security_group_rule" "ec2_http_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]

  description = "Allow HTTP access from anywhere"
}

resource "aws_security_group_rule" "ec2_all_sgr" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]

  description = "Allow all outbound traffic"
}
