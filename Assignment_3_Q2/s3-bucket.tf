resource "aws_s3_bucket" "aman_s3_bucket" {
  bucket = "aman-tf-bucket"
  count  = 2
  tags = {
    Name    = "Aman Mittal-${count.index}"
    Owner   = "aman.mittal@cloudeq.com"
    Purpose = "training"
  }

}