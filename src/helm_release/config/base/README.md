# helm_release config base

This is designed to create a helm release config with some generally good defaults that can easily be overridden with parameters.

This can provide a good way to generate a base config for downstream projects.

See [the helm_release config](/src/helm_release/config/README.md) for more details.

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^helm_release\/config\/base\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).


## Examples

Here is an example on how to use helm_release config base

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config/base?ref=helm_release/config/base/999.999.999"

  name                       = var.name
  namespace                  = var.namespace
  chart                      = var.chart
}
```
