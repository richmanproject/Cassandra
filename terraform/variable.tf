variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type = string
}

variable "public-subnet-1-cidr" {
  default = "10.0.0.0/24"
  description = "Public Subnet 1 CIDR Block"
  type = string
}

variable "public-subnet-2-cidr" {
  default = "10.0.2.0/24"
  description = "Public Subnet 2 CIDR Block"
  type = string
}

variable "public-subnet-3-cidr" {
  default = "10.0.3.0/24"
  description = "Public Subnet 3 CIDR Block"
  type = string
}

variable "ssh-location" {
  default = "0.0.0.0/0" #Best practice Normally limited to your IP address
  description = "IP Address That Can SSH Into the EC2 Instance"
  type = string
}

variable "key_name" {
  default = "oregonkey"
}

variable "redhatami" {
  default = "ami-0b28dfc7adc325ef4"
}


