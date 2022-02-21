# helmrelease config

This is used to create a configuration object for helm chart releases.

It's a base object that provides all the things required for a helm release, and the [submodule genneratebase](/src/helmrelease/config/base/README.md) gives good defaults. It can then be further configured and used in downstream projects to provide better defaults.

Overrides are calculated by ignoring nulls at every step. For the order the baseconfig populates values, override config then pushes values on top, and finally the variable parameters push values on top of that.

## Find Tags

To find a usable tag run:

```bash
git tag -l | grep -E '^helmrelease\/config\/[0-9]+\.[0-9]+\.[0-9]+$' | sort -r
```

Typically you'll want the latest version (found at the top of the last command, you can append ` | head -n 1` to just get the most recent version).

## Examples

Here is an example on how to use helmrelease config

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease/config?ref=helmrelease/config/999.999.999"

  name                       = var.name
  namespace                  = var.namespace
  chart                      = var.chart
}
```
