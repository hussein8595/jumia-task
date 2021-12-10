provider "aws" {
  region = "eu-west-2"
  access_key =  "XXX"
  secret_key =  "XXX"
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "http" {
}


