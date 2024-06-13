resource "aws_iam_role" "aws_service_ec2_role" {
  name               = "iam_role_ec2"
  assume_role_policy = data.aws_iam_policy_document.ec2_policy.json
  tags               = local.tags
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.aws_service_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_instance_profie" {
  name = "ec2_iam_role"
  role = aws_iam_role.aws_service_ec2_role.name
  tags = local.tags
}
