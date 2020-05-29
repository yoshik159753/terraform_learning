provider "aws" {
  profile    = "default"
  region     = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-09dd2e08d601bff67"
  instance_type = "t2.micro"
}
