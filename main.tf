locals {
  create_mongodb_instance = var.create_mongodb_instance
  set_mongodb_backup      = var.set_mongodb_backup
  create_mongodb_account  = var.create_mongodb_account
}

################################################################################
# Mongodb Instance
################################################################################
resource "tencentcloud_mongodb_instance" "mongodb" {
  count = local.create_mongodb_instance ? 1 : 0

  instance_name = var.mongodb_instance_name

  engine_version         = var.mongodb_engine_version
  machine_type           = var.mongodb_machine_type
  memory                 = var.memory
  volume                 = var.volume
  available_zone         = var.available_zone
  availability_zone_list = var.availability_zone_list
  vpc_id                 = var.mongodb_vpc_id
  subnet_id              = var.mongodb_subnet_id
  security_groups        = var.mongodb_security_groups
  project_id             = var.project_id
  password               = var.mongodb_password
  charge_type            = var.charge_type
  prepaid_period         = var.prepaid_period
  auto_renew_flag        = var.auto_renew_flag
  hidden_zone            = var.hidden_zone
  node_num               = var.node_num
  tags                   = var.mongodb_tags
}

################################################################################
# Mongodb Instance Backup
################################################################################
resource "tencentcloud_mongodb_instance_backup" "instance_backup" {
  count = local.set_mongodb_backup ? 1 : 0

  instance_id   = local.create_mongodb_instance ? tencentcloud_mongodb_instance.mongodb[0].id : var.mongodb_instance_id
  backup_method = var.backup_method
  backup_remark = var.backup_remark
}

################################################################################
# Mongodb Instance Account
################################################################################
resource "tencentcloud_mongodb_instance_account" "instance_account" {
  count = local.create_mongodb_account ? 1 : 0

  instance_id         = local.create_mongodb_instance ? tencentcloud_mongodb_instance.mongodb[0].id : var.mongodb_instance_id
  user_name           = var.account_name
  password            = var.account_password
  mongo_user_password = var.mongodb_password
  user_desc           = var.account_desc
  auth_role {
    mask      = var.auth_role.mask
    namespace = var.auth_role.namespace
  }
}
