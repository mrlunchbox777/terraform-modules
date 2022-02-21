# helm_release config

This is used to create a configuration object for the [helm_release module](/src/helm_release/README.md).

It's a base object that provides all the things required for a helm release, and the [helm_release config base](/src/helm_release/config/base/README.md) gives good defaults. It can then be further configured and used in downstream projects to provide better defaults.

Overrides are calculated by ignoring nulls at every step. For the order the baseconfig populates values, override config then pushes values on top, and finally the variable parameters push values on top of that.

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^helm_release\/config\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Examples

Here is an example on how to use helm_release config

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helm_release/config?ref=helm_release/config/999.999.999"

  name                       = var.name
  namespace                  = var.namespace
  chart                      = var.chart
}
```
