resource "google_compute_target_pool" "instance_target_pool" {
  name = "${var.group_name}-pool"
}

#TODO add healthcheck

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "${var.group_name}-instance-group"
  base_instance_name = var.group_name
  zone               = var.zone
  target_size        = var.target_size
  target_pools       = [google_compute_target_pool.instance_target_pool.id]

  wait_for_instances_status = "STABLE"
  version {
    name              = var.version_name
    instance_template = var.template_id
  }

  named_port {
    name = "http"
    port = var.named_port
  }
}


resource "google_compute_autoscaler" "instance_group_scaler" {
  name   = "${var.group_name}-scaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.instance_group_manager.id
  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period
    cpu_utilization {
      target = var.target_cpu_utilization
    }
    load_balancing_utilization {
      target = var.target_load_balancing_utilization
    }

  }
}

