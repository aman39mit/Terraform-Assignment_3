#creating a vpc
resource "aws_vpc" "aman-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
    enable_dns_support = "true"  #provides an internal domain name
    enable_dns_hostnames = "true"  #provides an internal host name
   # enable_classiclink = "false" 

  tags = {
    Name = "aman-vpc"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
  }
}
#first subnet
resource "aws_subnet" "aman-subnet1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.aman-vpc.id
  map_public_ip_on_launch = true # This makes the subnet public

  tags = {
    Name = "aman-subnet1"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
  }
}

# creating instance
resource "aws_instance" "aman-instance1" {
  count = var.var-instance1
   ami= "ami-0f1a5f5ada0e7da53"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.aman-subnet1.id
   security_groups = ["${aws_security_group.aman-security.id}"]
tags ={
    Name ="aman-instance1-${count.index}"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
}
volume_tags = {
    Name ="aman-vol"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
  "availability_zone" = "us-west-2"
  size= 40
}
}

#second subnet
resource "aws_subnet" "aman-subnet2" {
 
  cidr_block              = "10.0.0.0/24"
  vpc_id                  = aws_vpc.aman-vpc.id
  map_public_ip_on_launch = true # for making our subnet public

  tags = {
    Name = "aman-subnet2"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
  }
}

# creating instance
resource "aws_instance" "aman-instance2" {
  count = var.var-instance2
   ami= "ami-0f1a5f5ada0e7da53"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.aman-subnet2.id
   security_groups = ["${aws_security_group.aman-security.id}"]
tags ={
    Name ="aman-instance2-${count.index}"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
}
volume_tags = {
    Name ="aman-vol"
    Owner = "aman.mittal@cloudeq.com"
    Purpose ="training"
  "availability_zone" = "us-west-2"
  size= 30
}
}
