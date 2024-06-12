data "aws_ami" "ami_amazon_linux_2_ami_hvm" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-06efb824bfe850db6"]
  }
}

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
