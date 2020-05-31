provider "aws" {
  profile    = "default"
  region     = "us-west-2"
}

# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-getting-started-guide-vudjeixg"
  acl    = "private"
}

# Change the aws_instance we declared earlier to now include "depends_on"
resource "aws_instance" "example" {
  ami           = "ami-003634241a8fcdec0"
  instance_type = "t2.micro"

  # Tells Terraform that this EC2 instance must be created only after the
  # S3 bucket has been created.
  depends_on = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

resource "aws_instance" "another" {
  ami           = "ami-09dd2e08d601bff67"
  instance_type = "t2.micro"
}
