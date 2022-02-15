# metallb

pulling the chart from [here](https://github.com/metallb/metallb/tree/main/charts/metallb)

## Example

Here is an example of how to use metallb

```terraform
module "metallb" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb?ref=metallb/1.0.0"

	providers {
		helm = helm.special
		kubernetes = kubernetes.special
	}
	
	configure_kind = true
}
```