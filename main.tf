# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration

provider "aws" {
  region = "eu-west-2" # London
  access_key = "AK..."
  secret_key = "..."

  default_tags {
    tags = {
      hashicorp-learn = "module-object-attributes"
    }
  }
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website"

  bucket_prefix = "module-object-attributes-"

  tags = {
    terraform     = "true"
    environment   = "dev"
    public-bucket = true
  }
}
