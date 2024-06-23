terraform {
  backend "s3" {
    bucket = "my-private-bucket" ## Change my-private-bucket to your bucket name
    key    = "GitHub/Repository/repository_name/terraform.tfstate" ## Change repository_name to the name of your repository
    region = "my-aws-region" ## Change to the AWS region of your bucket
  }
}
