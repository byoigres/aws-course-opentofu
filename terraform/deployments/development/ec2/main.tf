locals {
  tags = merge(var.tags, {
    "Name" = "My first instance"
  })
}

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.ami_amazon_linux_2_ami_hvm.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.developer.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profie.name
  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags = merge(local.tags, {
      RootBlockDevice = true
    })
  }
  user_data = file("ec2-user-data.sh")
  vpc_security_group_ids = [
    aws_security_group.ec2_security_group.id
  ]
  tags = local.tags
}
