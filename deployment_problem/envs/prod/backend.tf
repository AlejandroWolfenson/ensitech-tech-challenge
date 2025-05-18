terraform {
  backend "s3" {
    bucket = "ensitech-challenge"
    key    = "terraform.tfstate"
    region = "us-east-1"   # Specify your AWS region
    
  }
}
