# terraform-tencentcloud-mongodb
Terraform module which creates Mongodb resources on TencentCloud

## Usage

```hcl
module "mongodb" {
  source = "terraform-tencentcloud-modules/mongodb/tencentcloud"

  mongodb_instance_name  = "mongodb"
  memory                 = 4
  volume                 = 100
  mongodb_engine_version = "MONGO_36_WT"
  mongodb_machine_type   = "HIO10G"
  available_zone         = "ap-guangzhou-3"
  mongodb_vpc_id         = "vpc-xxxxxx"
  mongodb_subnet_id      = "subnet-xxxxxx"
  mongodb_password       = "xxxxx"

  mongodb_tags = {
    "createby" = "terraform"
  }
}
```

## Examples

- [Simple](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-mongodb/tree/master/examples/simple-ccn)
- [Complete](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-mongodb/tree/master/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >=1.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >=1.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_mongodb_instance.mongodb](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/mongodb_instance) | resource |
| [tencentcloud_mongodb_instance_account.instance_account](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/mongodb_instance_account) | resource |
| [tencentcloud_mongodb_instance_backup.instance_backup](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/mongodb_instance_backup) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_desc"></a> [account\_desc](#input\_account\_desc) | The password corresponding to the mongouser account. mongouser is the system default account, which is the password set when creating an instance. | `string` | `null` | no |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The new account name. Its format requirements are as follows: character range [1,32]. Characters in the range of [A,Z], [a,z], [1,9] as well as underscore \_ and dash - can be input. | `string` | `null` | no |
| <a name="input_account_password"></a> [account\_password](#input\_account\_password) | New account password. Password complexity requirements are as follows: character length range [8,32]. Contains at least letters, numbers and special characters (exclamation point!, at@, pound sign #, percent sign %, caret ^, asterisk *, parentheses (), underscore \_). | `string` | `null` | no |
| <a name="input_auth_role"></a> [auth\_role](#input\_auth\_role) | The read and write permission information of the account. | <pre>object({<br>    mask      = number<br>    namespace = string<br>  })</pre> | `null` | no |
| <a name="input_auto_renew_flag"></a> [auto\_renew\_flag](#input\_auto\_renew\_flag) | Auto renew flag. Valid values are 0(NOTIFY\_AND\_MANUAL\_RENEW), 1(NOTIFY\_AND\_AUTO\_RENEW) and 2(DISABLE\_NOTIFY\_AND\_MANUAL\_RENEW). Default value is 0. Note: only works for PREPAID instance. Only supports0 and 1 for creation. | `number` | `null` | no |
| <a name="input_availability_zone_list"></a> [availability\_zone\_list](#input\_availability\_zone\_list) | A list of nodes deployed in multiple availability zones. For more information, please use the API DescribeSpecInfo. - Multi-availability zone deployment nodes can only be deployed in 3 different availability zones. It is not supported to deploy most nodes of the cluster in the same availability zone. For example, a 3-node cluster does not support the deployment of 2 nodes in the same zone. - Version 4.2 and above are not supported. - Read-only disaster recovery instances are not supported. - Basic network cannot be selected. | `list(string)` | `null` | no |
| <a name="input_available_zone"></a> [available\_zone](#input\_available\_zone) | The available zone of the Mongodb. | `string` | `null` | no |
| <a name="input_backup_method"></a> [backup\_method](#input\_backup\_method) | 0:logical backup, 1:physical backup. | `number` | `0` | no |
| <a name="input_backup_remark"></a> [backup\_remark](#input\_backup\_remark) | Backup notes. | `string` | `null` | no |
| <a name="input_charge_type"></a> [charge\_type](#input\_charge\_type) | The charge type of instance. Valid values are PREPAID and POSTPAID\_BY\_HOUR. Default value is POSTPAID\_BY\_HOUR. Note: TencentCloud International only supports POSTPAID\_BY\_HOUR. Caution that update operation on this field will delete old instances and create new one with new charge type. | `string` | `"POSTPAID_BY_HOUR"` | no |
| <a name="input_create_mongodb_account"></a> [create\_mongodb\_account](#input\_create\_mongodb\_account) | Controls if Mongodb account should be created. | `bool` | `false` | no |
| <a name="input_create_mongodb_instance"></a> [create\_mongodb\_instance](#input\_create\_mongodb\_instance) | Controls if Mongodb instance should be created (it affects almost all resources). | `bool` | `true` | no |
| <a name="input_hidden_zone"></a> [hidden\_zone](#input\_hidden\_zone) | The availability zone to which the Hidden node belongs. This parameter must be configured to deploy instances across availability zones. | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory size. The minimum value is 2, and unit is GB. Memory and volume must be upgraded or degraded simultaneously. | `number` | `2` | no |
| <a name="input_mongodb_engine_version"></a> [mongodb\_engine\_version](#input\_mongodb\_engine\_version) | Version of the Mongodb, and available values include MONGO\_36\_WT (MongoDB 3.6 WiredTiger Edition), MONGO\_40\_WT (MongoDB 4.0 WiredTiger Edition) and MONGO\_42\_WT (MongoDB 4.2 WiredTiger Edition). NOTE: MONGO\_3\_WT (MongoDB 3.2 WiredTiger Edition) and MONGO\_3\_ROCKS (MongoDB 3.2 RocksDB Edition) will deprecated. | `string` | `"MONGO_36_WT"` | no |
| <a name="input_mongodb_instance_id"></a> [mongodb\_instance\_id](#input\_mongodb\_instance\_id) | Id of Mongodb Instance. | `string` | `null` | no |
| <a name="input_mongodb_instance_name"></a> [mongodb\_instance\_name](#input\_mongodb\_instance\_name) | Name of the Mongodb instance. | `string` | `null` | no |
| <a name="input_mongodb_machine_type"></a> [mongodb\_machine\_type](#input\_mongodb\_machine\_type) | Type of Mongodb instance, and available values include HIO(or GIO which will be deprecated, represents high IO) and HIO10G(or TGIO which will be deprecated, represents 10-gigabit high IO). | `string` | `"HIO10G"` | no |
| <a name="input_mongodb_password"></a> [mongodb\_password](#input\_mongodb\_password) | Password of this Mongodb account. | `string` | `null` | no |
| <a name="input_mongodb_security_groups"></a> [mongodb\_security\_groups](#input\_mongodb\_security\_groups) | ID of the security group. | `set(string)` | `null` | no |
| <a name="input_mongodb_subnet_id"></a> [mongodb\_subnet\_id](#input\_mongodb\_subnet\_id) | ID of the subnet within this VPC. The value is required if vpc\_id is set. | `string` | `null` | no |
| <a name="input_mongodb_tags"></a> [mongodb\_tags](#input\_mongodb\_tags) | The tags of the Mongodb. Key name project is system reserved and can't be used. | `map(string)` | `{}` | no |
| <a name="input_mongodb_vpc_id"></a> [mongodb\_vpc\_id](#input\_mongodb\_vpc\_id) | ID of the VPC. | `string` | `null` | no |
| <a name="input_node_num"></a> [node\_num](#input\_node\_num) | The number of nodes in each replica set. Default value: 3. | `number` | `3` | no |
| <a name="input_prepaid_period"></a> [prepaid\_period](#input\_prepaid\_period) | The tenancy (time unit is month) of the prepaid instance. Valid values are 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 24, 36. NOTE: it only works when charge\_type is set to PREPAID. | `number` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project which the instance belongs. | `number` | `0` | no |
| <a name="input_set_mongodb_backup"></a> [set\_mongodb\_backup](#input\_set\_mongodb\_backup) | Controls if Mongodb Backup should be set. | `bool` | `false` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | Disk size. The minimum value is 25, and unit is GB. Memory and volume must be upgraded or degraded simultaneously. | `number` | `25` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mongodb_instance_id"></a> [mongodb\_instance\_id](#output\_mongodb\_instance\_id) | The Id of mongodb instance. |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
