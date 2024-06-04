# main.tf
provider "aws" {
  region = "us-east-1"
  #add endpoint config for localstack
  endpoints {
    ec2         = "http://localhost:4566"
    sts         = "http://localhost:4566"
    }
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
  #add endpoint config for localstack
  endpoints {
    ec2         = "http://localhost:4566"
    sts         = "http://localhost:4566"
    }
}

module "vpc_east1" {
  source = "./modules/vpc"

  providers = {
    aws = aws
  }

  region            = "us-east-1"
  availability_zone = var.availability_zone_us_east_1
}

module "vpc_east2" {
  source = "./modules/vpc"

  providers = {
    aws = aws.us-east-2
  }

  region            = "us-east-2"
  availability_zone = var.availability_zone_us_east_2
}

module "ec2_east_1" {
  source = "./modules/ec2"

  providers = {
    aws = aws
  }

  instance_name     = var.instance_name_us_east_1
  instance_type     = var.instance_type_us_east_1
  subnet_id         = module.vpc_east1.subnet_id
  security_group_id = module.vpc_east1.security_group_id
}

module "ec2_east_2" {
  source = "./modules/ec2"

  providers = {
    aws = aws.us-east-2
  }

  instance_name     = var.instance_name_us_east_2
  instance_type     = var.instance_type_us_east_2
  subnet_id         = module.vpc_east2.subnet_id
  security_group_id = module.vpc_east2.security_group_id
}