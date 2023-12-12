provider "tencentcloud" {
  region = local.region
}

resource "tencentcloud_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  name       = "tf_mongodb_vpc"
}

resource "tencentcloud_subnet" "subnet" {
  vpc_id            = tencentcloud_vpc.vpc.id
  name              = "subnet-example"
  cidr_block        = "10.0.0.0/16"
  availability_zone = "ap-guangzhou-3"
  is_multicast      = false
}

locals {
  region = "ap-guangzhou"

  mongodb_instance_name  = "mongodb"
  memory                 = 4
  volume                 = 100
  mongodb_engine_version = "MONGO_36_WT"
  mongodb_machine_type   = "HIO10G"
  available_zone         = "ap-guangzhou-3"
  mongodb_vpc_id         = tencentcloud_vpc.vpc.id
  mongodb_subnet_id      = tencentcloud_subnet.subnet.id
  mongodb_password       = "password1234"

  mongodb_tags = {
    "createby" = "terraform"
  }
}

module "mongodb_instance" {
  source = "../../"

  mongodb_instance_name  = local.mongodb_instance_name
  mongodb_engine_version = local.mongodb_engine_version
  mongodb_machine_type   = local.mongodb_machine_type
  memory                 = local.memory
  volume                 = local.volume
  available_zone         = local.available_zone
  mongodb_vpc_id         = local.mongodb_vpc_id
  mongodb_subnet_id      = local.mongodb_subnet_id
  mongodb_password       = local.mongodb_password

  mongodb_tags = local.mongodb_tags
}