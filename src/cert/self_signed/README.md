# cert self_signed

## Example

Here is an example of how to use self_signed_cert

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/cert/self_signed?ref=cert/self_signed/1.0.0"

	providers {
		tls = tls.special
	}
}
```
