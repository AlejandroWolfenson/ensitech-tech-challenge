terraform {
  backend "s3" {
    bucket = "kosher-terraform-network-tfstate"
    key    = "akkosher-v1-testing-tfstate/terraform.tfstate"
    region = "us-east-1"   # Specify your AWS region
    
  }
}
