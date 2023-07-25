output "group" {
  value = google_compute_instance_group_manager.instance_group_manager.instance_group
}

output "group_id" {
  value = google_compute_instance_group_manager.instance_group_manager.instance_group.id
}

output "group_status" {
  value = google_compute_instance_group_manager.instance_group_manager.instance_group.status
}
