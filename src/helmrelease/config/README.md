# helmrelease config

This is used to create a configuration object for helm chart releases.

It's a base object that provides all the things required for a helm release, and the [submodule genneratebase](/src/helmrelease/config/base/) gives good defaults. It can then be further configured and used in downstream projects to provide better defaults.

Overrides are calculated by ignoring nulls at every step. For the order the baseconfig populates values, override config then pushes values on top, and finally the variable parameters push values on top of that.

## Examples

Here is an example on how to use helmrelease config

```terraform
module "config" {
  source = "git::https://github.com/mrlunchbox777/terraform-modules//src/helmrelease/config?ref=helmrelease/config/1.0.0"

  name                       = var.name
  namespace                  = var.namespace
  chart                      = var.chart
}
```
