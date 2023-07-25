# Instance Group Manager Terraform Module

This Terraform module creates a managed instance group in Google Cloud Platform, based on a instance template.

## Usage

You can use this module by referencing it in your Terraform code:

```terraform
module "instance_group_manager" {
  source  = "git@github.com:Retize-io/terraform_gce_instance_group.git?ref=v1.0.0"

  group_name                          = "my-group"
  target_size                         = 2
  version_name                        = "my-version"
  template_id                         = "my-template-id"
  zone                                = "us-central1-a"
  min_replicas                        = 1
  max_replicas                        = 3
  named_port                          = 80
  target_load_balancing_utilization   = 0.9
  target_cpu_utilization              = 0.9
  cooldown_period                     = 150
}
```

Make sure to replace the values with your own group name, target size, version name, template ID, zone, minimum replicas, maximum replicas, named port, target load balancing utilization, target CPU utilization, and cooldown period.

## Inputs

| Name                              | Description                                                        | Type     | Default         | Required |
| --------------------------------- | ------------------------------------------------------------------ | -------- | --------------- | -------- |
| group_name                        | The name of the instance group to create.                          | `string` | n/a             | yes      |
| target_size                       | The desired number of instances in the instance group.             | `number` | `1`             | no       |
| version_name                      | The name of the version to be created.                             | `string` | n/a             | yes      |
| template_id                       | The ID of the instance template to use for the instance group.     | `string` | n/a             | yes      |
| zone                              | The zone in which to create the resources.                         | `string` | `us-central1-a` | no       |
| min_replicas                      | The minimum number of replicas to maintain for the instance group. | `number` | `1`             | no       |
| max_replicas                      | The maximum number of replicas to allow for the instance group.    | `number` | `1`             | no       |
| named_port                        | The port number to expose on the instances in the instance group.  | `number` | `80`            | no       |
| target_load_balancing_utilization | The target load balancing utilization for the autoscaler.          | `number` | `0.9`           | no       |
| target_cpu_utilization            | The target CPU utilization for the autoscaler.                     | `number` | `0.9`           | no       |
| cooldown_period                   | The cooldown period for the autoscaler.                            | `number` | `150`           | no       |

## Outputs

| Name         | Description                       |
| ------------ | --------------------------------- |
| group        | The instance group resource.      |
| group_id     | The ID of the instance group.     |
| group_status | The status of the instance group. |

## Contributing

Contributions are welcome! Please read the [contributing guidelines](CONTRIBUTING.md) before submitting a pull request.

## Authors

This module is maintained by [1cadumagalhaes](https://github.com/1cadumagalhaes).

## License

This module is licensed under the Mozilla Public License 2.0. See [LICENSE](LICENSE) for full details.