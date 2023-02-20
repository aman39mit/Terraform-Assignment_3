terraform {
  backend "s3" {
    bucket = "aman-tf-bucket"
    key    = "aman-backendfile.tfstate"
    region = "ap-south-1"
  }
}