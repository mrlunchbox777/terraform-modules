# helmrelease

## Example

Here is an example of how to use helmrelease

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease?ref=helmrelease/1.0.0"

	providers {
		helm = helm.special
		kubernetes = kubernetes.special
	}
}
```
