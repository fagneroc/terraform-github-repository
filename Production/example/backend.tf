terraform {
  backend "s3" {
    bucket = "fagneroc-example-bucket"
    key    = "GitHub/Repository/fagneroc-example/terraform.tfstate"
    region = "us-east-1"
  }
}
