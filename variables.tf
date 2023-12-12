# mongodb instance
variable "create_mongodb_instance" {
  description = "Controls if Mongodb instance should be created (it affects almost all resources)."
  type        = bool
  default     = true
}

variable "mongodb_instance_name" {
  description = "Name of the Mongodb instance."
  type        = string
  default     = null
}

variable "mongodb_engine_version" {
  description = "Version of the Mongodb, and available values include MONGO_36_WT (MongoDB 3.6 WiredTiger Edition), MONGO_40_WT (MongoDB 4.0 WiredTiger Edition) and MONGO_42_WT (MongoDB 4.2 WiredTiger Edition). NOTE: MONGO_3_WT (MongoDB 3.2 WiredTiger Edition) and MONGO_3_ROCKS (MongoDB 3.2 RocksDB Edition) will deprecated."
  type        = string
  default     = "MONGO_36_WT"
}

variable "mongodb_machine_type" {
  description = "Type of Mongodb instance, and available values include HIO(or GIO which will be deprecated, represents high IO) and HIO10G(or TGIO which will be deprecated, represents 10-gigabit high IO)."
  type        = string
  default     = "HIO10G"
}

variable "memory" {
  description = "Memory size. The minimum value is 2, and unit is GB. Memory and volume must be upgraded or degraded simultaneously."
  type        = number
  default     = 2
}

variable "volume" {
  description = "Disk size. The minimum value is 25, and unit is GB. Memory and volume must be upgraded or degraded simultaneously."
  type        = number
  default     = 25
}

variable "available_zone" {
  description = "The available zone of the Mongodb."
  type        = string
  default     = null
}

variable "availability_zone_list" {
  description = "A list of nodes deployed in multiple availability zones. For more information, please use the API DescribeSpecInfo. - Multi-availability zone deployment nodes can only be deployed in 3 different availability zones. It is not supported to deploy most nodes of the cluster in the same availability zone. For example, a 3-node cluster does not support the deployment of 2 nodes in the same zone. - Version 4.2 and above are not supported. - Read-only disaster recovery instances are not supported. - Basic network cannot be selected."
  type        = list(string)
  default     = null
}

variable "mongodb_vpc_id" {
  description = "ID of the VPC."
  type        = string
  default     = null
}

variable "mongodb_subnet_id" {
  description = "ID of the subnet within this VPC. The value is required if vpc_id is set."
  type        = string
  default     = null
}

variable "mongodb_security_groups" {
  description = "ID of the security group."
  type        = set(string)
  default     = null
}

variable "project_id" {
  description = "ID of the project which the instance belongs."
  type        = number
  default     = 0
}

variable "mongodb_password" {
  description = "Password of this Mongodb account."
  type        = string
  sensitive   = true
  default     = null
}

variable "charge_type" {
  description = "The charge type of instance. Valid values are PREPAID and POSTPAID_BY_HOUR. Default value is POSTPAID_BY_HOUR. Note: TencentCloud International only supports POSTPAID_BY_HOUR. Caution that update operation on this field will delete old instances and create new one with new charge type."
  type        = string
  default     = "POSTPAID_BY_HOUR"
}

variable "prepaid_period" {
  description = "The tenancy (time unit is month) of the prepaid instance. Valid values are 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 24, 36. NOTE: it only works when charge_type is set to PREPAID."
  type        = number
  default     = null
}

variable "auto_renew_flag" {
  description = "Auto renew flag. Valid values are 0(NOTIFY_AND_MANUAL_RENEW), 1(NOTIFY_AND_AUTO_RENEW) and 2(DISABLE_NOTIFY_AND_MANUAL_RENEW). Default value is 0. Note: only works for PREPAID instance. Only supports0 and 1 for creation."
  type        = number
  default     = null
}

variable "hidden_zone" {
  description = "The availability zone to which the Hidden node belongs. This parameter must be configured to deploy instances across availability zones."
  type        = string
  default     = null
}

variable "node_num" {
  description = "The number of nodes in each replica set. Default value: 3."
  type        = number
  default     = 3
}

variable "mongodb_tags" {
  description = "The tags of the Mongodb. Key name project is system reserved and can't be used."
  type        = map(string)
  default     = {}
}

# mongodb backup
variable "mongodb_instance_id" {
  description = "Id of Mongodb Instance."
  type        = string
  default     = null
}

variable "set_mongodb_backup" {
  description = "Controls if Mongodb Backup should be set."
  type        = bool
  default     = false
}

variable "backup_method" {
  description = "0:logical backup, 1:physical backup."
  type        = number
  default     = 0
}

variable "backup_remark" {
  description = "Backup notes."
  type        = string
  default     = null
}

# mongodb account
variable "create_mongodb_account" {
  description = "Controls if Mongodb account should be created."
  type        = bool
  default     = false
}

variable "account_name" {
  description = "The new account name. Its format requirements are as follows: character range [1,32]. Characters in the range of [A,Z], [a,z], [1,9] as well as underscore _ and dash - can be input."
  type        = string
  default     = null
}

variable "account_password" {
  description = "New account password. Password complexity requirements are as follows: character length range [8,32]. Contains at least letters, numbers and special characters (exclamation point!, at@, pound sign #, percent sign %, caret ^, asterisk *, parentheses (), underscore _)."
  type        = string
  default     = null
}

variable "account_desc" {
  description = "The password corresponding to the mongouser account. mongouser is the system default account, which is the password set when creating an instance."
  type        = string
  default     = null
}

variable "auth_role" {
  description = "The read and write permission information of the account."
  type = object({
    mask      = number
    namespace = string
  })
  default = null
}