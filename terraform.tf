terraform {
  backend "s3" {
    bucket = "nikhithbucket"
    key    = "State-Files/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "backened"
  }
}