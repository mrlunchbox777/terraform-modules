# metallb

Pulling the chart from [here](https://github.com/metallb/metallb/tree/main/charts/metallb)

Configured with [metallb config module](/src/metallb/config/README.md)

If you are looking for a configuration for a development machine using kind [here are good defaults](/src/metallb/config/kind/README.md)

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^metallb\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Example

Here is an example of how to use metallb

```terraform
module "metallb" {
	source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb?ref=metallb/999.999.999"

	providers {
		helm = helm.special
		kubernetes = kubernetes.special
	}
	
	configure_kind = true
}
```
