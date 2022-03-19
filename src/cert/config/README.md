# self_signed_cert config

This is intended to be an easier to use wrapper around the [tls_locally_signed_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) and [tls_self_signed_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) in terraform. It makes use of a [config module](/src/cert/config/README.md) that allows for merging configs.

// That merging allows starting with a [config base module](/src/helm_release/config/base/README.md) and then having modules implement that with good defaults while still allowing end users to customize everything.

## Example

Here is an example of how to use self_signed_cert config

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/cert/config?ref=cert/config/1.0.0"

	providers {
		tls = tls.special
	}
}
```
