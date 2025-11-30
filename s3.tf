resource "aws_s3_bucket" "s3-test-bucket" {
  bucket = "devops-nestapi-test-pipeline-bucket"

  tags = {
    Iac = true
  }
}
