# helmrelease

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^helmrelease\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Example

Here is an example of how to use helmrelease

```terraform
module "pi_hole" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease?ref=helmrelease/999.999.999"

	providers {
		helm = helm.special
		kubernetes = kubernetes.special
	}
}
```
