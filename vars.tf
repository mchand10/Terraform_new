variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0a313d6098716f372"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
}  
}
variable "RDS_PASSWORD" { 
default = "test1234"
}
