resource "aws_instance" "ec2-instance" {
  instance_type = "t2.micro"
  ami           = var.ami
  count         = 2

  tags = {
    Name    = "Aman Mittal-${count.index}"
    Owner   = "aman.mittal@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name                = "Aman Mittal-${count.index}"
    Owner               = "aman.mittal@cloudeq.com"
    Purpose             = "training"
    "availability_zone" = "ap-south-1"
    size                = 20
  }
}
