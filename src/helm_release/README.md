# helm_release

This is intended to be an easier to use wrapper around the [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) in terraform. It makes use of a [config module](/src/helm_release/config/README.md) that allows for merging configs. That merging allows starting with a [config base module](/src/helm_release/config/base/README.md) and then having modules implement that with good defaults while still allowing end users to customize everything.

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^helm_release\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Example

Here is an example of how to use helm_release

```terraform
module "release" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release?ref=helm_release/999.999.999"

	config = module.my_custom_config_generator
}
```
