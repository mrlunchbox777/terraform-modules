# pi-hole

## Example

Here is an example of how to use pihole

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/pihole?ref=pi-hole/1.0.0"

	providers {
		helm = helm.special
		kubernetes = kubernetes.special
	}
}
```
