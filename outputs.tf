output "mongodb_instance_id" {
  description = "The Id of mongodb instance."
  value       = var.create_mongodb_instance ? concat(tencentcloud_mongodb_instance.mongodb[*].id, [""])[0] : null
}
