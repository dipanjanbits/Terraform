resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket}"

  tags = {
    Name        = "${var.bucket}"
    Environment = "${var.env}"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}