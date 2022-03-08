# self_signed_cert

## Example

Here is an example of how to use self_signed_cert

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/self_signed_cert?ref=self_signed_cert/1.0.0"

	providers {
		tls = tls.special
	}
}
```
