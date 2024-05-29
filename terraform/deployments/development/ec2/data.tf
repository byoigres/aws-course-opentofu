data "aws_ami" "ami_amazon_linux_2_ami_hvm" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-06efb824bfe850db6"]
  }
}
