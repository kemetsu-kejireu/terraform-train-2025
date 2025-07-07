terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"         ## プロバイダーのバージョン
    }
  }
  required_version = ">= 1.0"       ## Terraformのバージョン
}

provider "aws" {
  region = "ap-northeast-1"         ## 東京リージョン
}
